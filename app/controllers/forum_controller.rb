class ForumController < ApplicationController
  def index
    @categories = Forum.where('parent_id = 0')
  end
end
