require 'rails_helper'

RSpec.describe Discounts::CalculateDiscountService, type: :service do
  subject { described_class.new(user, product) }

  let!(:category1) { Category.create(name: 'Cate 1') }
  let!(:category2) { Category.create(name: 'Cate 2') }

  before do
    Discount.create(percentage: 10, category: category1)
  end

  describe '#call' do
    context 'match user purchase_count rule' do
      let!(:user) { User.create(token: SecureRandom.hex(8), purchase_count: 3) }
      let!(:product) { Product.create(price: 100, category: category2) }

      it do
        result = subject.call
        expect(result[:final_price]).to eq(95)
        expect(result[:discount_perc]).to eq(5)
      end
    end

    context 'match product price rule' do
      let!(:user) { User.create(token: SecureRandom.hex(8), purchase_count: 2) }
      let!(:product) { Product.create(price: 200, category: category2) }

      it do
        result = subject.call
        expect(result[:final_price]).to eq(170)
        expect(result[:discount_perc]).to eq(15)
      end
    end

    context 'match product category rule' do
      let!(:user) { User.create(token: SecureRandom.hex(8), purchase_count: 2) }
      let!(:product) { Product.create(price: 100, category: category1) }

      it do
        result = subject.call
        expect(result[:final_price]).to eq(90)
        expect(result[:discount_perc]).to eq(10)
      end
    end

    context 'match all of rules' do
      let!(:user) { User.create(token: SecureRandom.hex(8), purchase_count: 3) }
      let!(:product) { Product.create(price: 200, category: category1) }

      it do
        result = subject.call
        expect(result[:final_price]).to eq(140)
        expect(result[:discount_perc]).to eq(30)
      end
    end
  end
end
