class ForumsController < ApplicationController
  def index
    @categories = Forum.where 'parent_id IS NULL'
  end

  def show
    @forum = Forum.find params[:id]
  end
end
