class Chapter < ActiveRecord::Base
	belongs_to :book, :counter_cache => true
	has_many :verses
	acts_as_list :scope => :book_id
end
