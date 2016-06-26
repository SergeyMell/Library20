class Section < ActiveRecord::Base

  validates_presence_of :old_idi, :old_obzor_idi
  validates_uniqueness_of :old_idi

  # This validation should be added after data restructuring
  # validates_uniqueness_of :title
  # validates_presence_of :title

  belongs_to :review
  has_many :subsections

  has_and_belongs_to_many :articles
end
