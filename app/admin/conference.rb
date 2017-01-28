ActiveAdmin.register Conference do

  permit_params :id, :title, :full_title, :month, :year, :place,
                user_ids: []

  index do |t|
    t.column :id
    t.column :title
    t.column :place
    t.column :month
    t.column :year

    actions
  end

  show do |t|
    attributes_table do
      row :id
      row :title
      row :full_title
      row :place
      row :month
      row :year
      row :users do
        t.users.map(&:login).join(', ')
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :full_title
      f.input :place
      f.input :month
      f.input :year
      f.input :users, as: :select2_multiple, collection: User.all
    end
    f.actions
  end


end
