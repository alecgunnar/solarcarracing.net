class TopicsController < ApplicationController
  def show
    @topic = Topic.find_by_seo_name params[:seo_name]
  end
end
