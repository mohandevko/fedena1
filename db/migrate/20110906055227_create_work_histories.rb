class CreateWorkHistories < ActiveRecord::Migration
  def self.up
    create_table :work_histories do |t|
    
      t.integer :user_id
      t.string :title
      t.string :company
      t.text :description
      t.date :start_date
      t.date :end_date
      
      t.timestamps
    end
  end

  def self.down
    drop_table :work_histories
  end
end
