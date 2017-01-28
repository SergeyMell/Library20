include Constants

class Conference < ActiveRecord::Base

  validates :title, :year, :month, presence: true, uniqueness: true

  enum month: MONTHS

  has_and_belongs_to_many :users
end
