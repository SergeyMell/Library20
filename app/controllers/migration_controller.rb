class MigrationController < ApplicationController

  def self.migrate_chapters
    OldRazdel.all.each do |old_razdel|
      Chapter.create!(
                 title: old_razdel.razdel_podst,
                 old_idi: old_razdel.n_razdel
      )
    end
  end

end
