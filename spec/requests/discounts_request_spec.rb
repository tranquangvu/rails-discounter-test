require 'rails_helper'

RSpec.describe 'Discounts', type: :request do
  let!(:category) { Category.create(name: 'Cate 1') }

  describe 'GET /discounts' do
    let!(:user) { User.create(token: SecureRandom.hex(8), purchase_count: 3) }
    let!(:product) { Product.create(price: 100, category: category) }

    it 'return not found' do
      get discounts_path
      expect(response).to have_http_status(:not_found)
    end

    it 'returns ok' do
      get discounts_path(user_token: user.token, product_id: product.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
