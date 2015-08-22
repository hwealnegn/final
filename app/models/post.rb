class Post < ActiveRecord::Base

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorited_by, through: :favorites, source: :user

end