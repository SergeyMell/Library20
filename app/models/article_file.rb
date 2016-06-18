class ArticleFile < ActiveRecord::Base

  belongs_to :article

  has_attached_file :file,
                    url: '/uploads/article_files/:id/:basename.:extension',
                    hash_secret: 'fileuploadfeedback123'


end
