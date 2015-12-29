class TopicsController < ApplicationController
  before_action :require_session, only: [:start, :create, :edit, :update]

  def show
    @topic = Topic.find params[:id]
  end

  def start
    @forum = Forum.find params[:forum_id]
    @topic = Topic.new
    @post  = Post.new

    render :start
  end

  def create
    @forum = Forum.find params[:forum_id]
    @topic = Topic.new topic_params
    @post  = Post.new post_params

    @topic.forum  = @forum
    @topic.author = current_user
    @post.topic   = @topic
    @post.author  = current_user

    if @topic.save
      if @post.save
        redirect_to @topic
        return
      end

      @topic.destroy
    end

    render :start
  end

  def edit
    @topic = Topic.find params[:id]
    @post  = Post.where('topic_id = ?', @topic.id).first
  end

  def update
    @topic = Topic.find params[:id]
    @post  = Post.where('topic_id = ?', @topic.id).first

    @topic.assign_attributes topic_params
    @post.assign_attributes post_params

    if @topic.valid? and @post.valid?
      @topic.save
      @post.save

      redirect_to @topic
    else
      render 'edit'
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:name)
    end

    def post_params
      params.require(:topic).permit(post: [:content])[:post]
    end
end
