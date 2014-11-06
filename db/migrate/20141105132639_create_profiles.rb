class CreateProfiles < ActiveRecord::Migration
  def up
  	create_table :profiles do |t|
	  	t.belongs_to :user
	  	t.string :fname
	  	t.string :lname
	  	t.text :description
	  	t.string :phone
	  	t.string :email
	  	t.timestamps
	end
  end

  def down
  	drop_table :profiles
  end
end
