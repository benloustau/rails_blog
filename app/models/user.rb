class User < ActiveRecord::Base
<<<<<<< HEAD
	has_many :posts
=======

  has_many :posts
  
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :followeds, through: :relationships

  has_many :reverse_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower


  validates_presence_of :fname, :lname, :email, :password, :location, :bio
  

>>>>>>> 233b3769b13bda15c665140fad8787ef661d4315
end
