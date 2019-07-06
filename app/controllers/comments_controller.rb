class CommentsController < ApplicationController
  def create
    @pic = Pic.find(params[:pic_id])
    @comment = @pic.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render :comment
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :comment
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
