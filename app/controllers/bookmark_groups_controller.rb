class BookmarkGroupsController < ApplicationController
  include BookmarkGroupsHelper

  before_action :authenticate_user!

  def index
    @bookmark_groups = get_bookmark_groups_by_user(current_user.id).as_api_response(:base)
  end

  def create
    BookmarkGroup.create!(permit_params)
    render json: {success: 0}
  rescue => e
    render status: 500, json: {error: e.message}
  end

  def update
    bookmark_group = BookmarkGroup.find(params[:id])
    bookmark_group.update!(permit_params)
    render json: {success: 0}
  rescue => e
    render status: 500, json: {error: e.message}
  end

  private

  def permit_params
    params.require(:bookmark_group).permit(:title, :user_id, :bookmark_group_id)
  end

end
