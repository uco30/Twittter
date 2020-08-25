class CommentsController < ApplicationController
  def create
    @tweeet = Tweeet.find(params[:tweeet_id])
    @comment = @tweeet.comments.create(params[:comment].permit(:name, :body, :user_id))
    @comment.user_id = current_user.id
    @comment.save
    redirect_to root_path
  end

  def destroy
    @tweeet = Tweeet.find(params[:tweeet_id])
    @comment = @tweeet.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end
end
