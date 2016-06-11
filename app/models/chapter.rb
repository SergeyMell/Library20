class Chapter < ActiveRecord::Base

  validates_presence_of :title, :old_idi
  validates_uniqueness_of :title, :old_idi

  has_many :reviews
end
