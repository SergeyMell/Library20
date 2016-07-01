class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :title

      t.timestamps
    end

    add_column :articles, :journal_id, :integer
    add_column :articles, :coauthors, :string
    add_column :articles, :publication_data, :string
  end
end
