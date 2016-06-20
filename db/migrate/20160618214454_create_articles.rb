class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :old_idi

      t.integer :author_id
      t.string :year


      t.timestamps
    end
  end
end
