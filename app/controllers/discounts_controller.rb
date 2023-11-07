class DiscountsController < ApplicationController
  before_action :find_calculated_resources, only: %i[calculate]

  def calculate
    data = Discounts::CalculateDiscountService.call(@user, @product)
    render json: data
  end

  private

  def find_calculated_resources
    @user = User.find_by!(token: params[:user_token])
    @product = Product.find(params[:product_id])
  end
end
