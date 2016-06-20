class CreateOldPosition4s < ActiveRecord::Migration
  def change
    create_table :old_position4s do |t|
      t.integer :position3_idi
      t.integer :position4_idi
      t.string :position4

      t.timestamps
    end
  end
end
