class Review < ActiveRecord::Base

  validates_presence_of :title, :old_idi, :old_razdel_idi
  validates_uniqueness_of :old_idi

  # This validation should be added after data restructuring
  # validates_uniqueness_of :title

  belongs_to :chapter
  has_many :sections
end
