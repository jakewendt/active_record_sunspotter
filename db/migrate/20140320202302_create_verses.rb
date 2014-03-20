class CreateVerses < ActiveRecord::Migration
	def change
		create_table :verses do |t|
			t.integer :chapter_id
			t.integer :position
			t.text :body
			t.timestamps
		end
	end
end
