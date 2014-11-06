class CreateStatus < ActiveRecord::Migration
  def up
  	create_table :status do |t|
  		t.string :code
  		t.string :description
  		t.timestamps
  	end
  end

  def down
  	drop_table :status
  end
end
