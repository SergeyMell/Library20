class CreateOldAuthors < ActiveRecord::Migration
  def change
    create_table :old_authors do |t|
      t.integer :author_idi
      t.integer :old_author_idi
      t.string :author_name
      t.string :short_i
      t.string :short_o
      t.string :imya
      t.string :otch

      t.timestamps
    end
  end
end
