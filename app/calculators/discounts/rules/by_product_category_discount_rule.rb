module Discounts
  module Rules
    class ByProductCategoryDiscountRule < BaseDiscountRule
      def matched?
        # Note: Actually we must use 3rd-party api `/api/v2/discount_value(:category_id )` to get discount data
        # But, in the requirement didn't give 3rd-party host, so i create Discount model to handle it by myself.
        @discount = Discount.find_by(category_id: product.category_id)
        @discount.present?
      end

      def discount_percentage
        @discount.percentage
      end
    end
  end
end
