# == Schema Information
#
# Table name: users
#
#  id             :uuid             not null, primary key
#  purchase_count :integer          default(0), not null
#  token          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_users_on_token  (token) UNIQUE
#
class User < ApplicationRecord
  # validations
  validates :token, presence: true, length: { minimum: 16 }, uniqueness: true
  validates :purchase_count, presence: true
end
