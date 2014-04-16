require 'test_helper'

class BookTest < ActiveSupport::TestCase
	test "should create with factory" do
		assert_difference('Book.count',1) {
			FactoryGirl.create(:book)
		}
	end
end
