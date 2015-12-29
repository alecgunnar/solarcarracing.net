class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :last_post, class_name: 'Post', foreign_key: 'last_post_id'
  has_many :replies, class_name: 'Post'

  validates_presence_of :name, :forum, :author

  before_save :set_post_date, on: :create
  after_create :update_forum_stats_for_create

  after_destroy :update_forum_stats_for_destroy

  def to_param
    "#{id}-#{seo_name}"
  end

  def name= (name)
    write_attribute :name, name
    set_seo_name
  end

  private
    def set_post_date
      self.post_date ||= Time.new
    end

    def set_seo_name
      self.seo_name = name.parameterize
    end

    def update_forum_stats_for_create
      forum.increment :num_topics
      forum.save
    end

    def update_forum_stats_for_destroy
      forum.decrement :num_topics
      forum.save
    end
end
