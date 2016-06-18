ActiveAdmin.register ArticleFile do

  permit_params :file

  form do |f|
    f.inputs do
      f.input :article
      f.input :file
    end
    f.actions
  end


end
