class CreateOldPosition1s < ActiveRecord::Migration
  def change
    create_table :old_position1s do |t|
      t.integer :article_idi
      t.integer :position1_idi
      t.string :position1

      t.timestamps
    end
  end
end
