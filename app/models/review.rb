class Review < ActiveRecord::Base

  validates_presence_of :title, :old_idi, :old_razdel_idi
  validates_uniqueness_of :title, :old_idi

  belongs_to :chapter
end
