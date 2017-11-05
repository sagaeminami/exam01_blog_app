class BlogsController < ApplicationController
  before_action :set_blog, only: [:show,:edit,:update,:destroy]
  before_action :logged_in_user, only: [:new,:edit,:show]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def confirm
    @blog = Blog.new(blog_params) # <=POSTされたパラメータを取得
  end


  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice:"ツイートを編集しました"
    else
      render 'edit'
    end
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice:"ツイートしました！"
    else
      render 'new'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ツイートを削除しました"
  end

  def favorite
    @favorite_blogs = current_user.favorite_blogs
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to new_session_path
    end
  end


  private
  def blog_params
    params.require(:blog).permit(:title,:content)
  end
end
