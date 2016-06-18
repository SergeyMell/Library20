class CreateOldArticles < ActiveRecord::Migration
  def change
    create_table :old_articles do |t|
      t.integer :author_idi
      t.integer :article_idi
      t.integer :article_id_old
      t.string :coauthors
      t.string :journal
      t.string :nazvanie
      t.string :year
      t.string :shapka1
      t.string :shapka2
      t.string :month_tp
      t.string :que
      t.boolean :vpechati
      t.string :status
      t.string :type_art
      t.string :http_address
      t.string :person
      t.string :word_abs

      t.string :word_abstr
      t.string :pdf_abstr
      t.string :word
      t.string :word2
      t.string :pdf
      t.string :browser_file
      t.string :packet
      t.string :transl

      t.date  :checked_up
      t.text :resume
      t.boolean :ref
      t.boolean :xerox
      t.text :mistake
      t.string :email
      t.string :file

      t.timestamps
    end
  end
end
