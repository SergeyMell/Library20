class Section < ActiveRecord::Base

  validates_presence_of :title

  belongs_to :review
  has_many :subsections

  has_and_belongs_to_many :articles
end
