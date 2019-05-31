class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string "address"
      t.integer "balance"
      t.timestamps
    end
  end
end
