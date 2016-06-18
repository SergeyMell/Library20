class CreateArticleFiles < ActiveRecord::Migration
  def change
    create_table :article_files do |t|
      t.integer :article_id
      t.timestamps
    end

    add_attachment :article_files, :file

  end
end
