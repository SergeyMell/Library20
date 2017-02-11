class Api::UsersController < ApplicationController

  def show
    user = User.last
    render json: user.as_api_response(:user)
  end
end
