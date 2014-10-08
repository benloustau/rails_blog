class CommentsController < ApplicationController
  before_action :set_comment, only: [:create, :edit, :update, :destroy]

  def create
    @comment = Comment.new(post_params)
    if @comment.save
      flash[:notice] = "New comment created!"
      redirect_to @post
    else
      flash[:notice] = "Sorry! Your comment did not go through!"
      render :new
    end
  end

  def edit 
  end 

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment updated!"
      redirect_to @post
    else 
      flash[:alert] = "Something went wrong with the update."
      render @post
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Comment was deleted."
    redirect_to users_path
  end

  private

  def comment_params
    params.require(:comment.id).permit(:body).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end


end