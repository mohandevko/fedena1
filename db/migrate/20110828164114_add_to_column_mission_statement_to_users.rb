class AddToColumnMissionStatementToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :mission_statement, :text
  end

  def self.down
    remove_column :users, :mission_statement
  end
end
