module BookmarkGroupsHelper

  def get_bookmark_groups
    BookmarkGroup.where(bookmark_group_id: nil)
  end

  def get_bookmark_groups_by_user(user_id)
    BookmarkGroup.joins('LEFT JOIN bookmark_groups_users ON bookmark_groups.id = bookmark_groups_users.bookmark_group_id')
        .where('bookmark_groups_users.user_id is NULL OR bookmark_groups_users.user_id = ?', user_id)
        .where(bookmark_group_id: nil)
  end

end
