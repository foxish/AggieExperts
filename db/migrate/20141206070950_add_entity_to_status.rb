class AddEntityToStatus < ActiveRecord::Migration
  def up
      add_column :status, :entity, :string
  end

  def down
      remove_column :status, :entity
  end
end
