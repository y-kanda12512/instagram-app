class PostsController < ApplicationController
  def index
    @posts = Posts.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
