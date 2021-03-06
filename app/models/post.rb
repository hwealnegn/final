class Post < ActiveRecord::Base

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorited_by, through: :favorites, source: :user
	has_many :taggings
	has_many :tags, through: :taggings

	# Reference for methods to manage tags (and tag implementation in general):
	# http://railscasts.com/episodes/382-tagging?view=asciicast
	def self.tagged_with(name)
		Tag.find_by_name!(name).posts
	end

	def self.tag_counts
		Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
		tags.map(&:name).join(", ")
	end

	def tag_list=(names)
		self.tags = names.split(",").map do |n|
			Tag.where(name: n.strip).first_or_create!
		end
	end

end