class InfoController < ApplicationController
  def index
    render json: { app: 'goapi', version: '0.0.1' }
  end
end
