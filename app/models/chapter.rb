class Chapter < ActiveRecord::Base

  validates_presence_of :title
  validates_uniqueness_of :title

  has_many :reviews

  has_and_belongs_to_many :articles
end
