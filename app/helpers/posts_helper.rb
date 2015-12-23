module PostsHelper
  def post_path (post)
    "#{topic_path post.topic}#post_#{post.id}"
  end
end
