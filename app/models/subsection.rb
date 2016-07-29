class Subsection < ActiveRecord::Base

  validates_presence_of :title

  belongs_to :section

  has_and_belongs_to_many :articles

end
