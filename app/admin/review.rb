ActiveAdmin.register Review do

  menu parent: 'Publications'

  permit_params :title, :chapter_id

end
