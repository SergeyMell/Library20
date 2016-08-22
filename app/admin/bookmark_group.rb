ActiveAdmin.register BookmarkGroup do

  menu :parent => 'Bookmarks'

  permit_params :title, :bookmark_group_id, user_ids: []

  form do |f|
    f.inputs do
      f.input :title
      f.input :bookmark_group
      f.input :users, as: :select2_multiple, collection: User.all
    end

    f.actions
  end

end
