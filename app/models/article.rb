class Article < ActiveRecord::Base

  validates_presence_of :title

  before_save :update_connections

  belongs_to :author

  has_many :article_files

  has_and_belongs_to_many :chapters
  has_and_belongs_to_many :reviews
  has_and_belongs_to_many :sections
  has_and_belongs_to_many :subsections

  def update_connections
    puts 'article data'
    puts self.chapters.inspect
  end
end
