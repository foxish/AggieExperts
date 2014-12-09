class DropPpics < ActiveRecord::Migration
  def up
    drop_table :ppics
  end

  def down
  end
end
