class CreateOldObzors < ActiveRecord::Migration
  def change
    create_table :old_obzors do |t|
      t.integer :n_from_razdel
      t.integer :n_obzor
      t.string :obzor_podst

      t.timestamps
    end
  end
end
