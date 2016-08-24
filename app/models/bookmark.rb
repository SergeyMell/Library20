class Bookmark < ActiveRecord::Base

  acts_as_api

  validates_presence_of :title, :link, :folder
  validates_uniqueness_of :title

  belongs_to :folder

  api_accessible :base do |t|
    t.add :id
    t.add :title
    t.add :link
  end

end
