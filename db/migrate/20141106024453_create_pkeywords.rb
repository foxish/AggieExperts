class CreatePkeywords < ActiveRecord::Migration
  def up
  	create_table :pkeywords do |t|
  		t.belongs_to :user
  		t.belongs_to :keyword
  		t.timestamps
 	end
  end

  def down
  	drop_table :pkeywords
  end
end
