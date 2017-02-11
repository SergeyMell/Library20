class CreateMassMediaReports < ActiveRecord::Migration
  def change
    create_table :mass_media_reports do |t|
      t.integer :report_id

      t.integer :number_of_internet_participations, default: 0
      t.integer :number_of_tv_participations, default: 0
      t.integer :number_of_radio_participations, default: 0

      t.integer :number_of_newspaper_publications, default: 0
      t.integer :number_of_magazine_publications, default: 0
      t.integer :number_of_brochures_published, default: 0
      t.integer :number_of_discusses, default: 0

      t.timestamps
    end
  end
end
