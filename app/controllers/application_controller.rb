class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_not_found
    render json: { message: 'The finding resource can not be found' }, status: :not_found
  end
end
