class CreateChapters < ActiveRecord::Migration
	def change
		create_table :chapters do |t|
			t.integer :book_id
			t.integer :position
			t.integer :verses_count, :default => 0
			t.timestamps
		end
	end
end
