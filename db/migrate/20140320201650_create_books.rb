class CreateBooks < ActiveRecord::Migration
	def change
		create_table :books do |t|
			t.string :title
			t.integer :chapters_count, :default => 0
			t.timestamps
		end
	end
end
