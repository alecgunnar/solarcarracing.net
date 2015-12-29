module ForumHelper
  def render_subforums (subforums)
    render 'forums/subforums', forums: subforums
  end
end
