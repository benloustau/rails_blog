class CommentsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "New post created!"
      redirect_to @post
    else
      flash[:notice] = "Sorry -you comment was not made!"
      render :new
    end
  end 

  def update
    if @Comment.update(comment_params)
      flash[:notice] = "Post updated!"
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
    params.require(:post.id).permit(:body).merge(user_id: current_user.id)
  end

  def set_comment
    @post = Comment.find(params[:id])
  end


end