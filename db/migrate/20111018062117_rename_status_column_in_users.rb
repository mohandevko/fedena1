class RenameStatusColumnInUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :status, :status_message
  end

  def self.down
    rename_column :users, :status_message, :status
  end
end
