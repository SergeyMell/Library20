class User < ActiveRecord::Base

  acts_as_api

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  has_and_belongs_to_many :bookmark_groups

  def email_required?
    false
  end

  def email_changed?
    false
  end

  api_accessible :bookmark_groups do |t|
    t.add :id
    t.add :login
    t.add :bookmark_groups, template: :base
  end
end
