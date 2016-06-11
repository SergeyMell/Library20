class MigrationController < ApplicationController

  def self.migrate_chapters
    OldRazdel.all.each do |old_razdel|
      Chapter.create!(
                 title: old_razdel.razdel_podst,
                 old_idi: old_razdel.n_razdel
      )
    end
  end

  def self.migrate_reviews
    OldObzor.transaction do

      OldObzor.all.each do |old_obzor|
        chapter = Chapter.where(old_idi: old_obzor.n_from_razdel).first
        raise 'Chapter not found' if chapter.blank?

        Review.create!(
                  title: old_obzor.obzor_podst,
                  chapter_id: chapter.id,

                  old_razdel_idi: old_obzor.n_from_razdel,
                  old_idi: old_obzor.n_obzor
        )
      end

    end
  end

end
