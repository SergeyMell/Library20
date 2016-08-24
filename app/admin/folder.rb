ActiveAdmin.register Folder do

  menu :parent => 'Bookmarks'

  permit_params :title, :folder_id, user_ids: []

  form do |f|
    f.inputs do
      f.input :title
      f.input :folder
      f.input :users, as: :select2_multiple, collection: User.all
    end

    f.actions
  end

end
