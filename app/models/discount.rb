# == Schema Information
#
# Table name: discounts
#
#  id          :uuid             not null, primary key
#  percentage  :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :uuid
#
# Indexes
#
#  index_discounts_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Discount < ApplicationRecord
  # associations
  belongs_to :category

  # validations
  validates :percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
