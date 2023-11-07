module Discounts
  module Rules
    class BaseDiscountRule
      attr_reader :user, :product

      def initialize(user, product)
        @user = user
        @product = product
      end

      def matched?
        raise NotImplementedError, 'Must implement `matched?` method'
      end

      def discount_percentage
        raise NotImplementedError, 'Must implement `discount_value` method'
      end
    end
  end
end
