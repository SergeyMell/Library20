class Subsection < ActiveRecord::Base

  validates_presence_of :title, :old_idi, :old_punkt_idi
  validates_uniqueness_of :old_idi

  # This validation should be added after data restructuring
  # validates_uniqueness_of :title

  belongs_to :section

  has_and_belongs_to_many :articles

end
