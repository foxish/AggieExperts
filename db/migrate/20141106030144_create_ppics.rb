class CreatePpics < ActiveRecord::Migration
    def up
  	create_table :ppics do |t|
  		t.belongs_to :user
  		t.binary :pic, :limit => 10.megabyte
  		t.timestamps
  	end
  end

  def down
  	drop_table :ppics
  end
end
