class CreateSusers < ActiveRecord::Migration
  def up
  	create_table :susers do |t|
  		t.string :email
  		t.string :activation_link
  		t.timestamp :active_till
  		t.timestamps
  	end
  end

  def down
  	drop_table :susers
  end
end
