ActiveAdmin.register Section do

  menu parent: 'Publications'

  permit_params :title, :review_id

end
