class CreateOldRazdels < ActiveRecord::Migration
  def change
    create_table :old_razdels do |t|
      t.integer :n_razdel
      t.string  :razdel_podst

      t.timestamps
    end
  end
end
