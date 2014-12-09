class AddInviteColumnsToSusers < ActiveRecord::Migration
  def up
      add_column :susers, :status_id, :integer
      add_column :susers, :name, :string
      add_column :susers, :department, :string
      add_column :susers, :message, :text
  end

  def down
      remove_column :susers, :status_id
      remove_column :susers, :name
      remove_column :susers, :department
      remove_column :susers, :message
  end
end
