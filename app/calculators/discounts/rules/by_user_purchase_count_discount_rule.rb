module Discounts
  module Rules
    class ByUserPurchaseCountDiscountRule < BaseDiscountRule
      def matched?
        user.purchase_count > 2
      end

      def discount_percentage
        5
      end
    end
  end
end
