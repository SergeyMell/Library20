class User < ActiveRecord::Base

  acts_as_api

  ROLES = %w(author patient doctor student teacher intent fellow_student)

  devise :database_authenticatable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  has_and_belongs_to_many :folders

  def email_required?
    false
  end

  def email_changed?
    false
  end

  api_accessible :folders do |t|
    t.add :id
    t.add :login
    t.add :folders, template: :base
  end
end
