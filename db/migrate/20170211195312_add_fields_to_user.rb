class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :docent_rate, :decimal, precision: 2, scale: 2, default: 0
    add_column :users, :assistant_rate, :decimal, precision: 2, scale: 2, default: 0
    add_column :users, :professor_rate, :decimal, precision: 2, scale: 2, default: 0
    add_column :users, :department_head_rate, :decimal, precision: 2, scale: 2, default: 0
  end
end
