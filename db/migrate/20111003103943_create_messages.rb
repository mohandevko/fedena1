class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
    
      t.integer :sender_id
      t.integer :receiver_id
      t.text :subject
      t.text :body
      t.integer :replying_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
