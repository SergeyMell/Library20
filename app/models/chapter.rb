class Chapter < ActiveRecord::Base

  validates_presence_of :title, :old_idi
  validates_uniqueness_of :title, :old_idi

  has_many :reviews

  has_and_belongs_to_many :articles
end
