# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @pics_per_page = 9
    @posted_pics = Pic.where(user_id: params[:id]).includes(:taggings).page(params[:page]).per(@pics_per_page)
    @liked_pics = @user.votes.up.for_type(Pic).votables
    @liked_pics = Kaminari.paginate_array(@liked_pics).page(params[:page]).per(@pics_per_page)
  end
end
