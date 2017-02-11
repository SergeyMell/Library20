class Api::UsersController < Api::BaseApiController

  def show
    user = User.last
    render json: user.as_api_response(:user)
  end

  def update
    user = User.last
    user.update!(permit_params)
    render nothing: true, status: :ok
  end

  private

  def permit_params
    params.require(:user).permit(
      :first_name, :last_name, :patronymic,
      :docent_rate, :assistant_rate, :professor_rate, :department_head_rate
    )
  end
end
