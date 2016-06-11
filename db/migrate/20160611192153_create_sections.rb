class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title, default: 'title is missing'
      t.integer :review_id

      t.integer :old_idi
      t.integer :old_obzor_idi

      t.timestamps
    end
  end
end
