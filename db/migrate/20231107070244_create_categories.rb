class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name, index: true, null: false, default: ''
      t.timestamps
    end
  end
end
