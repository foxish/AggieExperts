class DropPpics < ActiveRecord::Migration
  def up
    drop_table :Ppics
  end

  def down
  end
end
