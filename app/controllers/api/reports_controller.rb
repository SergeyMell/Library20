class Api::ReportsController < Api::BaseApiController

  def show
    user = User.last
    report = user.reports.find_or_create_by!(
                  year: params[:year],
                  month: params[:month]
    )
    render json: report
  end
end
