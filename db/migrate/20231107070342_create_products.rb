class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, id: :uuid do |t|
      t.decimal :price, precision: 8, scale: 2, null: false, default: 0
      t.references :category, type: :uuid, index: true, foreign_key: true
      t.timestamps
    end
  end
end
