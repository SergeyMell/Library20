class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id, add_index: true
      t.integer :year
      t.integer :month

      t.timestamps
    end

  end
end
