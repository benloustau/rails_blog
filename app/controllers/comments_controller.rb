class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = Comment.new
    
    unless params[:comment][:body].empty?
      @comment.body = params[:comment][:body]
      @comment.user_id = current_user.id
      @comment.post_id = params[:post_id]
      @comment.save
    end

    redirect_to users_path
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
    if current_user.id == @comment.user.id
    @comment.destroy
    flash[:notice] = "Comment was deleted."
    redirect_to root_path
    else
    flash[:notice] = "You are not the owner of this comment"
    redirect_to root_path
    end  
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end


end