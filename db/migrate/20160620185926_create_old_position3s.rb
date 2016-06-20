class CreateOldPosition3s < ActiveRecord::Migration
  def change
    create_table :old_position3s do |t|
      t.integer :position2_idi
      t.integer :position3_idi
      t.string :position3

      t.timestamps
    end
  end
end
