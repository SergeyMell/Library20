class CreateSubsections < ActiveRecord::Migration
  def change
    create_table :subsections do |t|
      t.string :title, default: 'title is missing'
      t.integer :section_id

      t.integer :old_idi
      t.integer :old_punkt_idi

      t.timestamps
    end
  end
end
