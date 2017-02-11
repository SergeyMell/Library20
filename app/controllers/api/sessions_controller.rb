class Api::SessionsController < Api::BaseApiController

  def create
    user = User.find_by_login!(params[:login])
    raise 'not found' unless user.valid_password?(params[:password])

    render nothing: :true, status: :ok
  end

  def destroy
    puts :destroy
  end

  def show
    render nothing: true, status: :ok
  end


end
