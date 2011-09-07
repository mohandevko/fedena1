class AddLocationToWorkHistory < ActiveRecord::Migration
  def self.up
    add_column :work_histories, :location, :string
  end

  def self.down
    remove_column :work_histories, :location
  end
end
