class RemoveOldIdi < ActiveRecord::Migration
  def change
    remove_column :articles, :old_idi if column_exists? :articles, :old_idi
    remove_column :authors, :old_idi if column_exists? :authors, :old_idi
    remove_column :chapters, :old_idi if column_exists? :chapters, :old_idi

    remove_column :reviews, :old_idi if column_exists? :reviews, :old_idi
    remove_column :reviews, :old_razdel_idi if column_exists? :reviews, :old_razdel_idi

    remove_column :sections, :old_idi if column_exists? :sections, :old_idi
    remove_column :sections, :old_obzor_idi if column_exists? :sections, :old_obzor_idi

    remove_column :subsections, :old_idi if column_exists? :subsections, :old_idi
    remove_column :subsections, :old_punkt_idi if column_exists? :subsections, :old_punkt_idi
  end
end
