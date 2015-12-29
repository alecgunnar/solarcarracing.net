class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :forum, polymorphic: :topic
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates_presence_of :topic, :author, :content

  before_save :set_post_date, on: :create
  after_create :update_stats_for_create

  private
    def set_post_date
      self.post_date ||= Time.new
    end

    def update_stats_for_create
      author.increment :num_posts
      author.save

      topic.update last_post: self, num_posts: topic.num_posts + 1
      topic.forum.update last_post: self, num_posts: topic.forum.num_posts + 1
    end
end
