class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.integer :user_id
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
