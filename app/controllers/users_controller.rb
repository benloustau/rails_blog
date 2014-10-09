class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy,:follow,:unfollow]

	def index
		@users = User.all
    @posts = Post.all
		@user = User.new
		@post = Post.new
	end
	
	def show
		@post = Post.new
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id	
			flash[:notice] = "Welcome to our site."
			redirect_to @user
		else
			flash[:alert] = "Hmmm. Something went wrong"
			render :new
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Profile updated"
			redirect_to @user
		else
			flash[:alert] = "There was a problem"
			render :edit
		end
	end

	def destroy
		if @user.destroy
			flash[:notice] = "Account deleted. BYE BYE"
			redirect_to users_path
		else 
			flash[:alert] = "Could not delete. Sorry"
			redirect_to users_path
		end	
	end	


	def follow
		@rel = Relationship.new(follower_id: current_user.id, followed_id: @user.id)
		if @rel.save
			flash[:notice] = "followed!"
			redirect_to @user
		else
		flash[:alert] = "Something went wrong"
		redirect_to @user
		end	
	end
	
	def unfollow
		@rel = Relationship.where(follower_id: current_user.id, followed_id: @user.id).first
		if @rel and @rel.destroy
			flash[:notice] = "unfollowed"
			redirect_to @user
		else
			flash[:alert] = "Something went wrong"
			redirect_to @user
		end
	end	

	private

	def user_params
		params.require(:user).permit(:fname, :lname, :email, :password, :location, :bio)
	end	

	def set_user
		@user = User.find(params[:id])
	end	
end
