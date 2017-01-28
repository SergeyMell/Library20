include Constants

class Report < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :year, :month
  enum month: MONTHS

end
