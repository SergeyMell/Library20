class User < ActiveRecord::Base

  acts_as_api

  devise :database_authenticatable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  has_and_belongs_to_many :folders
  has_and_belongs_to_many :conferences
  has_many :reports

  has_attached_file :avatar,
                    url: '/uploads/avatars/:id/:basename.:extension',
                    hash_secret: 'useravatars'

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
