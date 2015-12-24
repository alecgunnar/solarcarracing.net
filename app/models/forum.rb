class Forum < ActiveRecord::Base
  belongs_to :category, class_name: 'Forum', foreign_key: 'parent_id'
  belongs_to :last_post, class_name: 'Post', foreign_key: 'last_post_id'
  has_many :forums, foreign_key: 'parent_id'
  has_many :topics
  has_many :posts, through: :topics

  validates_presence_of :seo_name

  def to_param
    "#{id}-#{seo_name}"
  end

  def name= (name)
    write_attribute :name, name
    set_seo_name
  end

  def last_post= (post)
    return unless last_post.nil? or post.post_date > last_post.post_date
    write_attribute :last_post_id, post.id
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
