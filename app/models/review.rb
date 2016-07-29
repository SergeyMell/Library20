class Review < ActiveRecord::Base

  validates_presence_of :title

  belongs_to :chapter
  has_many :sections

  has_and_belongs_to_many :articles
end
