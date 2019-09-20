# frozen_string_literal: true

class PicsController < ApplicationController
  before_action :find_pic, only: %i[show edit update destroy like unlike]
  before_action :authenticate_user!, except: %i[index show]
  before_action :lastpath, only: %i[destroy]

  def index
    @search = Pic.ransack(params[:q])
    
    @pics_per_page = 9
    @pics = if params[:q]
              @search.result.page(params[:page]).per(@pics_per_page)
            elsif params[:tag_name]
              Pic.tagged_with(params[:tag_name]).page(params[:page]).per(@pics_per_page)
            else
              Pic.all.order('created_at DESC').page(params[:page]).per(@pics_per_page)
            end
  end

  def new
    @pic = current_user.pics.build
  end

  def show
    @comment = Comment.new
    @comments = @pic.comments.includes(:user)
    @pic.address.slice!(0..2)
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic, notice: '投稿されました!'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: 'Pic was updated'
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    if @lastpath[:controller] == 'users'
      redirect_to user_path(@pic.user_id)
    else
      redirect_to pics_path
    end
  end

  def like
    render :like if @pic.liked_by current_user
  end

  def unlike
    render :like if @pic.unliked_by current_user
  end

  def insta; end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :image, :tag_list, :address, :latitude, :longitude)
  end

  def find_pic
    @pic = Pic.find_by(id: params[:id])
  end
  
  def lastpath
    @lastpath = Rails.application.routes.recognize_path(request.referer)
  end
end
