class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id, add_index: true
      t.integer :year
      t.integer :month

      t.timestamps
    end

    add_column :users, :is_author, :boolean, default: false
    add_column :users, :is_patient, :boolean, default: false
    add_column :users, :is_doctor, :boolean, default: false
    add_column :users, :is_student, :boolean, default: false
    add_column :users, :is_teacher, :boolean, default: false
    add_column :users, :is_intern, :boolean, default: false
    add_column :users, :is_fellow_student, :boolean, default: false

  end
end
