class Folder < ActiveRecord::Base

  acts_as_api

  validates_presence_of :title
  validate :belong_either_user_or_folder

  belongs_to :folder
  has_many :folders
  has_many :bookmarks

  has_and_belongs_to_many :users

  def belong_either_user_or_folder
    if !self.users.blank? && !self.folder.blank?
      errors.add(:folder, 'Folder should belong either to user or to another folder. Not both')
      errors.add(:users, 'Folder should belong either to user or to another folder. Not both')
    end
  end

  api_accessible :base do |t|
    t.add :id
    t.add :title
    t.add lambda{|folder| folder.folders.order(:title) }, as: :folders
    t.add lambda{|folder| folder.bookmarks.order(:title) }, as: :bookmarks
  end

end
