class ProfileController < ApplicationController
  def show
    @user = User.find_by_seo_name params[:seo_name]
  end
end
