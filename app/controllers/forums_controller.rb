class ForumsController < ApplicationController
  def index
    @categories = Forum.joins(:forums).where('forums.parent_id is null').uniq
  end

  def show
    @forum = Forum.find params[:id]
  end
end
