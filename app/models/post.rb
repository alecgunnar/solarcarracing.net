class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates_presence_of :topic, :author, :post_date, :content

  before_validation :set_post_date
  after_create :update_topic_stats, :update_forum_stats, :update_author_stats

  private
    def set_post_date
      self.post_date = Time.new
    end

    def update_topic_stats
      topic.last_post = self
      topic.increment :num_posts
      topic.save!
    end

    def update_forum_stats
      topic.forum.increment :num_posts
      topic.forum.save!
    end

    def update_author_stats
      author.increment :num_posts
      author.save!
    end
end
