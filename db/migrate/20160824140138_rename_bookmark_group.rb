class RenameBookmarkGroup < ActiveRecord::Migration
  def up
    rename_column :bookmark_groups, :bookmark_group_id, :folder_id
    rename_column :bookmarks, :bookmark_group_id, :folder_id

    rename_table :bookmark_groups, :folders
    rename_column :bookmark_groups_users, :bookmark_group_id, :folder_id
    rename_table :bookmark_groups_users, :folders_users
  end

  def down
    rename_column :folders, :folder_id, :bookmark_group_id
    rename_column :bookmarks, :folder_id, :bookmark_group_id

    rename_table :folders, :bookmark_groups
    rename_column :folders_users, :folder_id, :bookmark_group_id
    rename_table :folders_users, :bookmark_groups_users
  end
end
