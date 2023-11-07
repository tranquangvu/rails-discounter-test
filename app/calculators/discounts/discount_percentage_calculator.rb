module Discounts
  class DiscountPercentageCalculator
    def initialize(discount_rules = [])
      @discount_rules = discount_rules
    end

    def total_discount_percentage
      @discount_rules.sum { |dr| dr.matched? ? dr.discount_percentage : 0 }
    end
  end
end
