class BookmarkGroup < ActiveRecord::Base

  acts_as_api

  validates_presence_of :title

  belongs_to :bookmark_group
  has_many :bookmark_groups
  has_many :bookmarks

  api_accessible :base do |t|
    t.add :id
    t.add :title
    t.add :bookmark_groups
    t.add :bookmarks
  end

end
