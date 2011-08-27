class ModifyUsersForOmniauth < ActiveRecord::Migration
  def self.up
    remove_index :users, :email
    change_column :users, :email, :string, :null => true
  end

  def self.down
    add_index :users, :email,                :unique => true
  end
end
