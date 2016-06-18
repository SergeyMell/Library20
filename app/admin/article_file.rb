ActiveAdmin.register ArticleFile do

  permit_params :file, :article_id

  index do |t|
    t.column :id
    t.column :article
    t.column 'File' do |article_file|
      article_file.file.exists? ? link_to(article_file.file.original_filename, article_file.file.url, :target => '_blank') : ''
    end
    actions
  end

  show do |article_file|
    attributes_table do
      row :id
      row :article
      row :file do
        article_file.file.exists? ? link_to(article_file.file.original_filename, article_file.file.url, :target => '_blank') : ''
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :article
      f.input :file
    end
    f.actions
  end


end
