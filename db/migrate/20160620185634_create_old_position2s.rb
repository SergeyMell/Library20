class CreateOldPosition2s < ActiveRecord::Migration
  def change
    create_table :old_position2s do |t|
      t.integer :position1_idi
      t.integer :position2_idi
      t.string :position2

      t.timestamps
    end
  end
end
