class Article < ActiveRecord::Base

  validates_presence_of :title

  before_save :update_connections

  belongs_to :author
  belongs_to :journal

  has_many :article_files

  has_and_belongs_to_many :chapters
  has_and_belongs_to_many :reviews
  has_and_belongs_to_many :sections
  has_and_belongs_to_many :subsections

  def update_connections
    self.subsections.each do |subsection|
      self.sections << subsection.try(:section)
    end

    self.sections.each do |section|
      self.reviews << section.try(:review)
    end

    self.reviews.each do |review|
      self.chapters << review.try(:chapter)
    end

    self.subsections = self.subsections.uniq
    self.sections = self.sections.uniq
    self.reviews = self.reviews.uniq
    self.chapters = self.chapters.uniq
  end

end
