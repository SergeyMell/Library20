class Article < ActiveRecord::Base

  validates_presence_of :title

  belongs_to :author

  has_many :article_files

end
