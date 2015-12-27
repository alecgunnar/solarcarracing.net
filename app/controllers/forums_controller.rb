class ForumsController < ApplicationController
  def index
    @categories = Forum.joins(:forums).uniq
  end

  def show
    @forum = Forum.find params[:id]
  end
end
