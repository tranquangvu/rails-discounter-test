module Discounts
  class CalculateDiscountService < ApplicationService
    attr_reader :user, :product

    def initialize(user, product)
      @user = user
      @product = product
    end

    def call
      discount_perc = discount_calculator.total_discount_percentage
      final_price = product.price * (1 - (discount_perc / 100.0))

      { final_price: final_price, discount_perc: discount_perc }
    end

    private

    def discount_calculator
      @discount_calculator ||= Discounts::DiscountPercentageCalculator.new(discount_rules)
    end

    def discount_rules
      @discount_rules ||= Discounts::Rules::BaseDiscountRule.default_rules(user, product)
    end
  end
end
