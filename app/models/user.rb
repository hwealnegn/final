class User < ActiveRecord::Base
	has_secure_password

  	validates :name, :email, :password, presence: true
  	validates :password, confirmation: true

  	has_many :posts
  	has_many :comments
  	has_many :favorites
  	has_many :favorited_posts, through: :favorites, source: :post
end
