require 'test_helper'

class VerseTest < ActiveSupport::TestCase

	test "should create with factory" do
		assert_difference('Book.count',1) {
		assert_difference('Chapter.count',1) {
		assert_difference('Verse.count',1) {
			FactoryGirl.create(:verse)
		} } }
	end



	if Verse.respond_to?(:solr_search)

		test "should search" do
			Sunspot.remove_all!                                     #       isn't always necessary

#                       Verse.solr_reindex
#       DEPRECATION WARNING: Relation#find_in_batches with finder options is deprecated. Please build a scope and then call find_in_batches on it instead. (called from irb_binding at (irb):1)
			Verse.find_each{|a|a.index}
			Sunspot.commit

			assert Verse.search.hits.empty?
			FactoryGirl.create(:verse)

#                       Verse.solr_reindex
#       DEPRECATION WARNING: Relation#find_in_batches with finder options is deprecated. Please build a scope and then call find_in_batches on it instead. (called from irb_binding at (irb):1)
			Verse.find_each{|a|a.index}
			Sunspot.commit

			assert !Verse.search.hits.empty?
		end

	else
		#
		#       Sunspot wasn't running when test started
		#
	end

end
