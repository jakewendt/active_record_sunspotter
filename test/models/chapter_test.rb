require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
	test "should create with factory" do
		assert_difference('Book.count',1) {
		assert_difference('Chapter.count',1) {
			FactoryGirl.create(:chapter)
		} }
	end
end
