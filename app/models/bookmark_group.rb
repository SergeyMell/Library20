class BookmarkGroup < ActiveRecord::Base

  acts_as_api

  validates_presence_of :title
  validate :belong_either_user_or_bookmark_group

  belongs_to :bookmark_group
  has_many :bookmark_groups
  has_many :bookmarks

  has_and_belongs_to_many :users

  def belong_either_user_or_bookmark_group
    if !self.users.blank? && !self.bookmark_group.blank?
      errors.add(:bookmark_group, 'Bookmark group should belong either to user or another bookmark group')
      errors.add(:users, 'Bookmark group should belong either to user or another bookmark group')
    end
  end

  api_accessible :base do |t|
    t.add :id
    t.add :title
    t.add :bookmark_groups
    t.add :bookmarks
  end

end
