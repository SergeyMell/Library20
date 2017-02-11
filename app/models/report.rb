include Constants

class Report < ActiveRecord::Base

  acts_as_api

  after_create :create_dependent_reports

  belongs_to :user
  has_one :rate_report
  has_one :hospital_report

  validates_presence_of :year, :month

  def create_dependent_reports
    self.create_rate_report
    self.create_hospital_report
  end

  api_accessible :full do |t|
    t.add :id
    t.add :year
    t.add :month
    t.add :rate_report
    t.add :get_hospital_report, as: :hospital_report
  end

  def get_hospital_report
    self.hospital_report || self.create_hospital_report
  end

end
