class Journal < ActiveRecord::Base

  validates_presence_of :title

  has_many :articles

end
