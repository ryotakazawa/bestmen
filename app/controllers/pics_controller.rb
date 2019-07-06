class PicsController < ApplicationController
  before_action :find_pic, only:[:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :lastpath, only:[:destroy, :upvote]
  
  def index
    @pics = Pic.all.order("created_at DESC")
  end
  
  def new
    @pic = current_user.pics.build
  end
  
  def show
    @comment = Comment.new
    @comments = @pic.comments
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
  
  
  private
    def pic_params
      params.require(:pic).permit(:title, :description, :image)
    end
    
    def find_pic
      @pic = Pic.find_by(id: params[:id])
    end
    
    def lastpath
      lastpath = Rails.application.routes.recognize_path(request.referer)
    end
end
