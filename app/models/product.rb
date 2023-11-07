# == Schema Information
#
# Table name: products
#
#  id          :uuid             not null, primary key
#  price       :decimal(8, 2)    default(0.0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :uuid
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  # associations
  belongs_to :category

  # validations
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
