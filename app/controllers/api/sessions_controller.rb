class Api::SessionsController < Api::BaseApiController

  def create
    puts :create
    render nothing: :true, status: :ok
  end

  def destroy
    puts :destroy
  end

  def show
    puts :show
  end


end
