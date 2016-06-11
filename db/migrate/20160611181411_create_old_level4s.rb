class CreateOldLevel4s < ActiveRecord::Migration
  def change
    create_table :old_level4s do |t|
      t.integer :punkt_idi
      t.integer :level_4_idi
      t.string :level_4

      t.timestamps
    end
  end
end
