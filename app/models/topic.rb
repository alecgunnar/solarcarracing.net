class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :last_post, class_name: 'Post', foreign_key: 'last_post_id'
  has_many :posts

  validates_presence_of :name, :seo_name, :forum, :author

  before_save :set_post_date, on: create
  after_create :update_parent_forum_stats, on: :create

  def to_param
    "#{id}-#{seo_name}"
  end

  def name= (name)
    write_attribute :name, name
    set_seo_name
  end

  def last_post= (post)
    write_attribute :last_post_id, post.id
    forum.last_post = post
  end

  def new_post (post)
    self.last_post = post
    increment :num_posts

    forum.increment :num_posts
    forum.save!
  end

  def del_post (post)
    if post == last_post
      forum.update_last_post if forum.last_post == last_post
      self.last_post = posts[-2]
    end

    decrement :num_posts

    forum.decrement :num_posts
    forum.save!
  end

  private
    def set_post_date
      self.post_date ||= Time.new
    end

    def set_seo_name
      self.seo_name = name.parameterize
    end

    def update_parent_forum_stats
      forum.increment :num_topics
      forum.save!
    end
end
