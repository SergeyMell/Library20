class Report < ActiveRecord::Base

  belongs_to :user

  MONTHS = {
    january: 1,
    february: 2,
    march: 3,
    april: 4,
    may: 5,
    june: 6,
    july: 7,
    august: 8,
    septembe: 9,
    october: 10,
    november: 11,
    december: 12
  }

  validates_presence_of :year, :month
  enum month: MONTHS

end
