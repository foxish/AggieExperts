class Login < ActiveRecord::Migration
  def up
      create_table :logins do |t|
          t.string :name
          t.text :description
          t.timestamps
      end
  end

  def down
      drop_table :logins
  end
end
