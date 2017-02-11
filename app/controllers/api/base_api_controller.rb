class Api::BaseApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  rescue_from 'StandardError' do |exception|
    render json: { error: exception.message, backtrace: exception.backtrace }, status: 500
  end

end
