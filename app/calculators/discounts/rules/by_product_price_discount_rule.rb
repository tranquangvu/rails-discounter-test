module Discounts
  module Rules
    class ByProductPriceDiscountRule < BaseDiscountRule
      def matched?
        product.price > 120
      end

      def discount_percentage
        15
      end
    end
  end
end
