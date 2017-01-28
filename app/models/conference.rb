include Constants

class Conference < ActiveRecord::Base

  validates :title, :year, :month, presence: true, uniqueness: true

  enum month: MONTHS

  has_many :conferences_users, class_name: ConferencesUsers
  has_many :users, through: :conferences_users
end
