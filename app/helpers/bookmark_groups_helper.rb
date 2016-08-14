module BookmarkGroupsHelper

  def get_bookmark_groups
    BookmarkGroup.where(bookmark_group_id: nil)
  end

end
