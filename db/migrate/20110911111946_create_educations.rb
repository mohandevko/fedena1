class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      
      t.integer :user_id
      t.string :qualification
      t.float :percentage
      t.date :year

      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
