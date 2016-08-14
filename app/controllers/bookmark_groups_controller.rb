class BookmarkGroupsController < ApplicationController
  include BookmarkGroupsHelper

  def index
    # @bookmark_groups = get_bookmark_groups
    #
    # respond_to do |format|
    #   format.json {render json: @bookmark_groups.as_api_response(:base)}
    # end
  end

end
