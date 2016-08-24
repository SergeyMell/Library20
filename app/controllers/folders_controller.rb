class FoldersController < ApplicationController
  include FoldersHelper

  before_action :authenticate_user!

  def index
    @folders = get_folders_by_user(current_user.id).order(:title).as_api_response(:base)
  end

  def create
    Folder.create!(permit_params)
    render json: {success: 0}
  rescue => e
    render status: 500, json: {error: e.message}
  end

  def update
    folder = Folder.find(params[:id])
    folder.update!(permit_params)
    render json: {success: 0}
  rescue => e
    render status: 500, json: {error: e.message}
  end

  private

  def permit_params
    params.require(:folder).permit(:title, :user_id, :folder_id)
  end

end
