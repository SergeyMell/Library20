module FoldersHelper

  def get_folders
    Folder.where(folder_id: nil)
  end

  def get_folders_by_user(user_id)
    Folder.joins('LEFT JOIN folders_users ON folders.id = folders_users.folder_id')
        .where('folders_users.user_id is NULL OR folders_users.user_id = ?', user_id)
        .where(folder_id: nil)
  end

end
