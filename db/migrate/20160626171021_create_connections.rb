class CreateConnections < ActiveRecord::Migration
  def change

    create_table :articles_chapters do |t|
      t.references :article
      t.references :chapter
    end

    create_table :articles_reviews do |t|
      t.references :article
      t.references :review
    end

    create_table :articles_sections do |t|
      t.references :article
      t.references :section
    end

    create_table :articles_subsections do |t|
      t.references :article
      t.references :subsection
    end

  end
end
