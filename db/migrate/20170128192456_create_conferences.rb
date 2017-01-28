class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :title
      t.text :full_title
      t.string :place
      t.integer :year
      t.integer :month

      t.timestamps
    end

    create_table :conferences_users, id: false do |t|
      t.integer :conference_id, index: true
      t.integer :user_id, index: true
    end

    add_index :conferences_users, [:conference_id, :user_id], unique: true
  end
end
