class PicsController < ApplicationController
  before_action :find_pic, only:[:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :lastpath, only:[:destroy, :upvote]
  
  def index
    @search = Pic.ransack(params[:q])
 
    if params[:q]
      @pics = @search.result.includes(:user, :taggings).page(params[:page]).per(3)
    elsif params[:tag_name]
      @pics = Pic.tagged_with(params[:tag_name]).page(params[:page]).per(3)
    else
      @pics = Pic.all.order("created_at DESC").page(params[:page]).per(3)
    end
  end
  
  def new
    @pic = current_user.pics.build
  end
  
  def show
    @comment = Comment.new
    @comments = @pic.comments.includes(:user)
  end
  
  def create
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      redirect_to @pic, notice: "投稿されました!"
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Pic was updated"
    else
      render 'edit'
    end
  end
  
  def destroy
    @pic.destroy
    if lastpath[:controller] == "users"
      redirect_to user_path(@pic.user_id)
    else
      redirect_to pics_path
    end
  end
  
  def like
    if @pic.liked_by current_user
      render :like
    end
  end
  
  def unlike
    if @pic.unliked_by current_user
      render :like
    end
  end
  
  def insta
  end
  
  private
    def pic_params
      params.require(:pic).permit(:title, :description, :image, :tag_list, :address, :latitude, :longitude)
    end
    
    def find_pic
      @pic = Pic.find_by(id: params[:id])
    end
    
    def lastpath
      lastpath = Rails.application.routes.recognize_path(request.referer)
    end
end
