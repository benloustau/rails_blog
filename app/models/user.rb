class User < ActiveRecord::Base
has_many :posts, dependent: :destroy
has_many :comments
has_many :relationships, foreign_key: :follower_id, dependent: :destroy
has_many :followeds, through: :relationships
has_many :reverse_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
has_many :followers, through: :reverse_relationships, source: :follower
validates_presence_of :fname, :lname, :email, :password, :location, :bio

has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "25x25>" }, :default_url => "placeholder.png"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def create
  @user = User.create( user_params )
	end


  def fullname
    fname + " " + lname
  end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def user_params
  params.require(:user).permit(:avatar)
end
end

