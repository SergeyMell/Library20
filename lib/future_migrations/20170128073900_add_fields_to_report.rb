class AddFieldsToReport < ActiveRecord::Migration
  def change
    # add_column :reports, :docent_rate, :decimal, precision: 2, scale: 2, default: 0
    # add_column :reports, :assistant_rate, :decimal, precision: 2, scale: 2, default: 0
    # add_column :reports, :professor_rate, :decimal, precision: 2, scale: 2, default: 0
    # add_column :reports, :department_head_rate, :decimal, precision: 2, scale: 2, default: 0

    add_column :reports, :patients, :integer, default: 0
    add_column :reports, :bed_days, :integer, default: 0
    add_column :reports, :patients_disease_histories, :text, limit: 16.megabytes - 1

    add_column :reports, :hospital_consults, :integer, default: 0
    add_column :reports, :hospital_disease_histories, :text, limit: 16.megabytes - 1
    add_column :reports, :minimally_invasive_interventionы, :integer, default: 0

    add_column :reports, :rounds_number, :integer, default: 0

    add_column :reports, :ambulance_consults, :integer, default: 0
    add_column :reports, :outer_ambulance_consults, :integer, default: 0
    add_column :reports, :ambulance_disease_histories, :text, limit: 16.megabytes - 1

    add_column :reports, :conciliums, :integer, default: 0

    add_column :reports, :clinic_conference_participations, :integer, default: 0
    add_column :reports, :clinic_conference_presentations, :integer, default: 0

    add_column :reports, :pathologic_conference_participations, :integer, default: 0
    add_column :reports, :pathologic_conference_presentations, :integer, default: 0

    add_column :reports, :disease_history_reviews, :integer, default: 0

    # TODO: Sanitarno prosv robota
    add_column :reports, :mass_media_internet_participations, :integer, default: 0
    add_column :reports, :mass_media_tv_participations, :integer, default: 0
    add_column :reports, :mass_media_radio_participations, :integer, default: 0
    add_column :reports, :mass_media_newspaper_publications, :integer, default: 0
    add_column :reports, :mass_media_magazine_publications, :integer, default: 0
    add_column :reports, :mass_media_brochure_publishing, :integer, default: 0
    add_column :reports, :mass_media_discuss, :integer, default: 0

    add_column :reports, :moh_attestation_commissions, :integer, default: 0
    add_column :reports, :moh_treatment_qualities, :integer, default: 0
    add_column :reports, :moh_college, :integer, default: 0
    add_column :reports, :moh_dnipro_commissions, :integer, default: 0

    add_column :reports, :practical_association_participations, :integer, default: 0
    add_column :reports, :practical_association_presentations, :integer, default: 0

    add_column :reports, :moh_docs_protocols, :integer, default: 0
    add_column :reports, :moh_docs_guidelines, :integer, default: 0
    add_column :reports, :moh_docs_orders, :integer, default: 0
    add_column :reports, :moh_docs_medic_technology, :integer, default: 0

    # TODO: Move to a separate table Conferences many-to-many with users
    add_column :reports, :sci_practic_organizing_committees, :integer, default: 0
    add_column :reports, :sci_practic_presentations, :integer, default: 0
    add_column :reports, :sci_practic_participations, :integer, default: 0
    add_column :reports, :sci_practic_certificate_local, :integer, default: 0
    add_column :reports, :sci_practic_certificate_foreign, :integer, default: 0
    add_column :reports, :sci_practic_traineeships, :integer, default: 0

    # TODO: Move to a separate table Courses many-to-many with users
    add_column :reports, :clinical_discipline_courses, :integer, default: 0
    add_column :reports, :clinical_discipline_course_titles, :integer, default: 0

    add_column :reports, :hospital_implementation_patents, :integer, default: 0
    add_column :reports, :hospital_implementation_info_paper, :integer, default: 0
    add_column :reports, :hospital_implementation_recommendations, :integer, default: 0
    add_column :reports, :hospital_implementation_innovations, :integer, default: 0

    # ORG METHODS
    add_column :reports, :hospital_annual_plans, :integer, default: 0
    add_column :reports, :hospital_annual_reports, :integer, default: 0
    add_column :reports, :medical_councils, :integer, default: 0
    add_column :reports, :moh_tasks, :integer, default: 0
    add_column :reports, :hospital_shortcoming_removing, :integer, default: 0
    add_column :reports, :org_method_help, :integer, default: 0
    add_column :reports, :org_method_help, :integer, default: 0
    add_column :reports, :cooperation_students, :integer, default: 0
    add_column :reports, :cooperation_interns, :integer, default: 0
    add_column :reports, :cooperation_doctors, :integer, default: 0
    add_column :reports, :org_method_others, :integer, default: 0
    add_column :reports, :hospital_quality_review, :integer, default: 0
    add_column :reports, :moh_expert_commission, :integer, default: 0

  end
end
