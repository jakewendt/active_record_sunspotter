FactoryGirl.define do
	factory :book do |f|
		f.sequence(:title) { |n| "Title #{n}" }
	end
	factory :chapter do |f|
		f.association :book
	end
	factory :verse do |f|
		f.association :chapter
	end
end	#	FactoryGirl.define do
