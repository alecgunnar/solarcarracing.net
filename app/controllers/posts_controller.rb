class PostsController < ApplicationController
  def show
    post = Post.find params[:id]
    redirect_to post.topic
  end

  def reply
    @topic = Topic.find params[:topic_id]
    @post  = Post.new
  end

  def create
    @topic = Topic.find params[:topic_id]
    @post  = Post.new post_params

    @post.assign_attributes({ topic: @topic, author: current_user })

    if @post.save
      redirect_to @post
    else
      render 'reply'
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    @post.assign_attributes post_params

    if @post.save
      redirect_to @post
    else
      render 'reply'
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
