class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :token, null: false, index: { unique: true }
      t.integer :purchase_count, null: false, default: 0
      t.timestamps
    end
  end
end
