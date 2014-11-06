class CreatePpublications < ActiveRecord::Migration
  def up
  	create_table :ppublications do |t|
  		t.belongs_to :user
  		t.string :title
  		t.string :url
  		t.timestamps
  	end
  end

  def down
  	drop_table :ppublications
  end
end
