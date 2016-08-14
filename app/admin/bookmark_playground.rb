include BookmarkGroupsHelper

ActiveAdmin.register_page 'Bookmark Playground' do

  menu :parent => 'Bookmarks'

  content do
    render partial: 'bookmark_playground'
  end

  controller do

    def index
      @bookmark_groups = get_bookmark_groups.as_api_response(:base)
    end

  end



end
