class CreateOldPunkts < ActiveRecord::Migration
  def change
    create_table :old_punkts do |t|
      t.integer :n_from_obzor
      t.integer :n_punct
      t.string :punct_podst

      t.timestamps
    end
  end
end
