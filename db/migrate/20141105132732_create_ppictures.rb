class CreatePpictures < ActiveRecord::Migration
  def up
  	create_table :ppictures do |t|
  		t.belongs_to :user
  		t.binary :pic, :limit => 10.megabyte
  		t.timestamps
  	end
  end

  def down
  	drop_table :ppictures
  end
end
