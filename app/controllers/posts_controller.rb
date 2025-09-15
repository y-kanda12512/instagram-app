class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    if @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to profile_path, notice: "投稿が完了しました"
      else
        flash.now[:alert] = "入力内容を確認してください"
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    if @post.update(post_params)
      redirect_to profile_path, notice: "投稿の更新が完了しました"
    else
      flash.now[:alert] = "入力内容を確認してください"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to post_path, notice: "削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:content, post_images: [])
  end
end
