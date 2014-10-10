class User < ActiveRecord::Base
has_many :posts, dependent: :destroy
has_many :comments
has_many :relationships, foreign_key: :follower_id, dependent: :destroy
has_many :followeds, through: :relationships
has_many :reverse_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
has_many :followers, through: :reverse_relationships, source: :follower
validates_presence_of :fname, :lname, :email, :password, :location, :bio

validates :avatar,
attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
attachment_size: { less_than: 5.megabytes }
 
   has_attached_file :avatar, styles: {thumb: '100x100>', square: '200x200#', medium: '300x300>'}
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def fullname
    fname + " " + lname
  end
end
