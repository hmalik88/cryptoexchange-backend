class CreateTransfer < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.integer "user_id"
      t.string "recipient_id"
      t.integer "amount"
      t.timestamps
    end
  end
end
