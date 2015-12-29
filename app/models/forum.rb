class Forum < ActiveRecord::Base
  belongs_to :category, class_name: 'Forum', foreign_key: 'parent_id'
  belongs_to :last_post, class_name: 'Post', foreign_key: 'last_post_id'
  has_many :forums, foreign_key: 'parent_id'
  has_many :topics
  has_many :posts, through: :topics

  validates_presence_of :seo_name

  @stack_last_post = nil

  def to_param
    "#{id}-#{seo_name}"
  end

  def name= (name)
    write_attribute :name, name
    set_seo_name
  end

  def num_topics_stack
    if forums.length > 0
      stack_topics = Forum.where('parent_id = ?', id).sum(:num_topics)
    end

    num_topics + (stack_topics || 0)
  end

  def num_posts_stack
    if forums.length > 0
      stack_posts = Forum.where('parent_id = ?', id).sum(:num_posts)
    end

    num_posts + (stack_posts || 0)
  end

  def last_post_stack
    # if forums.length > 0 and @stack_last_post.nil?
    #   @stack_last_post = Forum.where('parent_id = ?', id).order('last_post_id desc').first
    # end

    # if !@stack_last_post.nil? and (last_post.nil? or @stack_last_post.last_post.post_date > last_post.post_date)
    #   @stack_last_post.last_post
    # else
    #   last_post
    # end

    last_post
  end

  # This method will update the last post
  # to whichever post is the second most recent.
  def update_last_post
    return unless posts.length > 1
    write_attribute :last_post_id, posts[-2].id
  end

  private
    def set_seo_name
      self.seo_name = name.parameterize
    end
end
