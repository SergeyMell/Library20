class CreateRateReports < ActiveRecord::Migration
  def change
    create_table :rate_reports do |t|
      t.integer :report_id, index: true
      t.decimal :docent_rate, precision: 2, scale: 2, default: 0
      t.decimal :assistant_rate, precision: 2, scale: 2, default: 0
      t.decimal :professor_rate, precision: 2, scale: 2, default: 0
      t.decimal :department_head_rate, precision: 2, scale: 2, default: 0

      t.timestamps
    end
  end
end
