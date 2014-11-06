class CreateUsers < ActiveRecord::Migration
  def up
  	create_table :users do |t|
  		t.string :email
  		t.string :password
  		t.datetime :activation_date
  		t.integer :state_id
  		t.timestamps
  	end
  end

  def down
  	drop_table :users
  end
end
