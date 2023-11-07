class CreateDiscounts < ActiveRecord::Migration[7.1]
  def change
    create_table :discounts, id: :uuid do |t|
      t.references :category, type: :uuid, index: true, foreign_key: true
      t.integer :percentage, null: false, default: 0
      t.timestamps
    end
  end
end
