include Helper

class User < ActiveRecord::Base

  acts_as_api

  devise :database_authenticatable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  has_and_belongs_to_many :folders
  has_many :conferences_users, class_name: ConferencesUsers
  has_many :conferences, through: :conferences_users
  has_many :reports

  has_many :rate_reports

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

  api_accessible :user do |t|
    t.add :first_name
    t.add :last_name
    t.add :patronymic
    t.add lambda{|user| absolute_path(user.avatar.url) }, as: :avatar

    t.add :docent_rate
    t.add :assistant_rate
    t.add :professor_rate
    t.add :department_head_rate
  end
end
