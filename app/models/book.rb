class Book < ActiveRecord::Base
	has_many :chapters
	has_many :verses, :through => :chapters

	def to_s
		title
	end
end
