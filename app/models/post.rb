class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :forum, polymorphic: :topic
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates_presence_of :topic, :author, :content

  before_save :set_post_date, on: create
  after_save :update_stats_for_create, on: create
  before_destroy :update_stats_for_delete

  private
    def set_post_date
      self.post_date ||= Time.new
    end

    def update_stats_for_create
      topic.new_post self
      topic.save!

      author.increment :num_posts
      author.save!
    end

    def update_stats_for_delete
      topic.del_post self
      topic.save!

      author.decrement :num_posts
      author.save!
    end
end
