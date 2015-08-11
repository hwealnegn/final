class Article < ActiveRecord::Base
	# has_one :post, as: :postable
	belongs_to :post
end