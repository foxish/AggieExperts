class CreateUroles < ActiveRecord::Migration
  def up
  	create_table :uroles do |t|
  		t.string :code
  		t.string :description
  		t.timestamps
  	end
  end

  def down
  	drop_table :uroles
  end
end
