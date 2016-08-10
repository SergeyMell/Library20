class CreateBookmarkGroups < ActiveRecord::Migration
  def change
    create_table :bookmark_groups do |t|
      t.string :title
      t.integer :bookmark_group_id

      t.timestamps
    end

    add_column :bookmarks, :bookmark_group_id, :integer

  end
end
