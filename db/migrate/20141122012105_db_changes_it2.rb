class DbChangesIt2 < ActiveRecord::Migration
  def up
  	create_table :uroles do |t|
  		t.string :code
  		t.string :description
  		t.timestamps
  	end
  	#changes to users table adding user role id and removing activation date
  	remove_column :users, :activation_date
  	add_column :users, :urole, :integer
  	#remove_column :users, :activation_date
  	#changes to profiles table to support title
  	add_column :profiles, :title, :string
  	# key in keywords table should be unique
  	change_column :keywords, :key, :string, {null: false}
  	add_index :keywords, :key, {unique: true}
  end

  def down
  	drop_table :uroles
  	remove_column :users, :urole
  	remove_column :profiles, :title
  	#add_column :users, :activation_date, :datetime
  	remove_index :keywords, :key
  end
end
