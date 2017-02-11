class CreateHospitalReports < ActiveRecord::Migration
  def change
    create_table :hospital_reports do |t|
      t.integer :report_id, index: true

      t.integer :number_of_patients, default: 0
      t.integer :number_of_bed_days, default: 0
      t.text :patient_disease_histories, limit: 16.megabytes - 1

      t.integer :number_of_consultations, default: 0
      t.text :consultation_disease_histories, limit: 16.megabytes - 1

      t.integer :number_of_miis, default: 0
      t.integer :number_of_rounds, default: 0
      t.timestamps
    end

  end
end
