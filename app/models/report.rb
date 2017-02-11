include Constants

class Report < ActiveRecord::Base

  belongs_to :user
  has_one :rate_report

  validates_presence_of :year, :month

end
