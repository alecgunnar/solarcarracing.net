class ForumsController < ApplicationController
  def index
    @categories = Forum.joins(:forums).where('forums.parent_id is null').uniq
  end

  def show
    @forum  = Forum.find params[:id]
    @topics = Topic.joins(:replies).where('topics.forum_id = ?', @forum.id).order('posts.post_date DESC').uniq
  end
end
