class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_path,notice: "#{favorite.blog.user.name}さんのブログをお気に入りにしました"
  end

  def  destroy
    favorite = current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
    redirect_to blogs_path,notice: "#{favorite.blog.user.name}さんのブログをお気に入りを解除しました"
  end
end
