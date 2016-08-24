include FoldersHelper

ActiveAdmin.register_page 'Bookmark Playground' do

  menu :parent => 'Bookmarks'

  content do
    render partial: 'bookmark_playground'
  end

  controller do

    def index
      @folders = get_folders.as_api_response(:base)
    end

  end



end
