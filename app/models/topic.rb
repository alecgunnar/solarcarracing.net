class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :forum, presence: true
  validates :author, presence: true

  before_create :prepare_topic
  after_create :update_forum_topic_count

  def to_param
    self.seo_name
  end

  private
    def prepare_topic
      self.post_date = Time.new

      # This looks awful... but it works :)
      self.seo_name = self.post_date.to_i.to_s
      self.seo_name << '-' + self.name.downcase.split.join('-').gsub(/[^a-z0-9\-]/, '').squeeze('-')[0, MAX_SEO_NAME_LENGTH]
    end

    def update_forum_topic_count
      forum.increment :num_topics
      forum.increment :num_posts, num_posts
      forum.save!
    end
end
