class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :posts

  validates_presence_of :name, :seo_name, :forum, :author

  before_validation :set_post_date
  after_save :create_seo_name, if: 'seo_name.nil?'
  after_create :update_parent_forum_stats, on: :create

  def to_param
    "#{id}-#{seo_name}"
  end

  def name= (name)
    write_attribute :name, name
    set_seo_name
  end

  private
    def set_post_date
      self.post_date = Time.new
    end

    def set_seo_name
      self.seo_name = name.parameterize
    end

    def update_parent_forum_stats
      forum.increment :num_topics
      forum.save!
    end
end
