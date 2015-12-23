class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates_presence_of :name, :forum, :author
  validates_length_of :name, maximum: SEO.max_name_length

  before_validation :set_post_date
  after_save :create_seo_name, if: 'seo_name.nil?'
  after_create :update_parent_forum_topic_count, on: :create

  def to_param
    self.seo_name
  end

  private
    def set_post_date
      self.post_date = Time.new
    end

    def create_seo_name
      update seo_name: SEO.generate_seo_name(self.id, self.name)
    end

    def update_parent_forum_topic_count
      forum.increment :num_topics
      forum.increment :num_posts, num_posts
      forum.save!
    end
end
