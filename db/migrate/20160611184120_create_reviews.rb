class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :chapter_id

      t.integer :old_razdel_idi
      t.integer :old_idi

      t.timestamps
    end
  end
end
