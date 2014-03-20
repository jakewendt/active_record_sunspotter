class Verse < ActiveRecord::Base
	belongs_to :chapter, :counter_cache => true
	acts_as_list :scope => :chapter_id

#	delegate :book, :to => :chapter

	include ActiveRecordSunspotter::Sunspotability
	
	add_sunspot_column(:id, :type => :integer)
	add_sunspot_column(:position, :default => true, :type => :integer)
	add_sunspot_column(:chapter, :default => true, :type => :integer,
		:meth => ->(s){ s.chapter.position })

	searchable_plus do
		text :book, :default_boost => 2 do 	
			chapter.book.title
		end
		text :body
	end

end
