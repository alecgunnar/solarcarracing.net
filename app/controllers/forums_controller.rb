class ForumsController < ApplicationController
  def index
    @categories = Forum.joins(:forums).where('forums.parent_id is null').uniq
  end

  def show
    @forum  = Forum.find params[:id]

    # Doesn't use the last_post.post_date because newly created topics to not have a last_post!
    @topics = Topic.joins(:replies).where('topics.forum_id = ?', @forum.id).order('posts.post_date DESC').uniq
  end
end
