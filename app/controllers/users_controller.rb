# frozen_string_literal: true

class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @pics = Pic.where(user_id: params[:id])
  end
  
end
