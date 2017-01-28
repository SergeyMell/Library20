ActiveAdmin.register Author do

  menu parent: 'Publications'

  permit_params :first_name, :last_name, :patronymic


end
