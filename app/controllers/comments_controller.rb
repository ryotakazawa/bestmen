# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @pic = Pic.find(params[:pic_id])
    @comment = @pic.comments.build(comment_params)
    @comment.user_id = current_user.id
    render :comment if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    render :comment if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
