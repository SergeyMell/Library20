class MigrationController < ApplicationController

  skip_before_filter :verify_authenticity_token

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

  def self.migrate_sections
    OldPunkt.transaction do
      OldPunkt.all.each do |old_punkt|
        review = Review.where(old_idi: old_punkt.n_from_obzor).first
        raise 'Review not found' if review.blank?

        Section.create!(
            title: old_punkt.punct_podst,
            review_id: review.id,

            old_idi: old_punkt.n_punct,
            old_obzor_idi: old_punkt.n_from_obzor
        )
      end
    end
  end

  def self.migrate_subsections
    OldLevel4.transaction do
      OldLevel4.all.each do |old_level4|
        section = Section.where(old_idi: old_level4.punkt_idi).first
        raise 'Section not found' if section.blank?

        Subsection.create!(
            title: old_level4.level_4,
            section_id: section.id,

            old_idi: old_level4.level_4_idi,
            old_punkt_idi: old_level4.punkt_idi
        )
      end
    end
  end

  def self.migrate_authors
    OldAuthor.transaction do
      OldAuthor.all.each do |old_author|

        Author.create!(
            first_name: old_author.imya || old_author.short_i,
            last_name: old_author.author_name,
            patronymic: old_author.otch || old_author.short_o,

            old_idi: old_author.author_idi
        )
      end
    end
  end

  def self.migrate_articles_base
    OldArticle.transaction do
      OldArticle.all.each do |old_article|

        Article.create!(
                   title: old_article.nazvanie,
                   old_idi: old_article.article_idi
        )

      end
    end
  end

  def self.migration
    migrate_chapters
    migrate_reviews
    migrate_sections
    migrate_subsections

    migrate_authors

    migrate_articles_base
  end

  def attach_files

  end

  def attach_files_action
    params[:file_list].each do |file|
      article_id = File.basename(file.original_filename, '.*')
      # ArticleFile.create(article_id: article_id, file: file)
    end

    render json: {
        success: 0
    }
  end

end
