class CreateBookmarkGroupUserRelation < ActiveRecord::Migration
  def change
    create_table :bookmark_groups_users do |t|
      t.references :bookmark_group
      t.references :user
    end
  end
end
