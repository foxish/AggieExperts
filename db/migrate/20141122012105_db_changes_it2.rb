class DbChangesIt2 < ActiveRecord::Migration
  def up
  	#changes to users table adding user role id and removing activation date
  	remove_column :users, :activation_date
  	add_column :users, :urole_id, :integer
  	#remove_column :users, :activation_date
  	#changes to profiles table to support title
  	add_column :profiles, :title, :string
  	remove_column :profiles, :lname
  	rename_column :profiles, :fname, :name
  	# key in keywords table should be unique
  	change_column :keywords, :key, :string, {null: false}
  	add_index :keywords, :key, {unique: true}
  end

  def down
  	drop_table :uroles
  	remove_column :users, :urole
  	remove_column :profiles, :title
  	add_column :users, :activation_date, :datetime
  	add_column :profiles, :lname, :string
  	rename_column :profiles, :name, :fname
  	remove_index :keywords, :key
  end
end
