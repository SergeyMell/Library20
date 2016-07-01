class MigrationController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def self.migrate_chapters
    OldRazdel.all.each do |old_razdel|
      Chapter.create!(
          title: old_razdel.razdel_podst,
          old_idi: old_razdel.n_razdel
      )
    end
    true
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
    true
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
    true
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
    true
  end

  def self.migrate_authors
    OldAuthor.transaction do
      OldAuthor.all.each do |old_author|

        Author.create!(
            first_name: old_author.imya && old_author.imya != '.' || old_author.short_i,
            last_name: old_author.author_name,
            patronymic: old_author.otch || old_author.short_o,

            old_idi: old_author.author_idi
        )
      end
    end
    true
  end

  def self.migrate_articles_base
    OldArticle.transaction do
      OldArticle.all.each do |old_article|

        Article.create!(
            title: old_article.nazvanie,
            year: old_article.year,
            old_idi: old_article.article_idi
        )
      end
    end
    true
  end

  def self.connect_authors_to_articles
    Article.transaction do
      Article.all.each do |article|
        old_article = OldArticle.where(article_idi: article.old_idi).first
        raise 'Article not found' if old_article.blank?

        author = Author.where(old_idi: old_article.author_idi).first
        raise 'Author not found' if author.blank?

        article.author_id = author.id
        article.save!
      end
    end
    true
  end

  def self.connect_articles_to_chapters
    OldPosition1.transaction do
      OldPosition1.all.each do |position1|
        article = Article.where(old_idi: position1.article_idi).first
        chapter = Chapter.where(title: position1.position1).first

        if !article.blank? && !chapter.blank?
          article.chapters << chapter
          article.save!
        end
      end
    end
    true
  end

  def self.connect_articles_to_reviews
    OldPosition2.transaction do
      OldPosition2.all.each do |position2|
        review = Review.where(title: position2.position2).first

        position1 = OldPosition1.where(position1_idi: position2.position1_idi).first
        next if position1.blank?

        article = Article.where(old_idi: position1.article_idi).first

        if !article.blank? && !review.blank?
          article.reviews << review
          article.save!
        end
      end
    end
    true
  end

  def self.connect_articles_to_sections
    OldPosition3.transaction do
      OldPosition3.all.each do |position3|
        section = Section.where(title: position3.position3).first

        position2 = OldPosition2.where(position2_idi: position3.position2_idi).first
        next if position2.blank?

        position1 = OldPosition1.where(position1_idi: position2.position1_idi).first
        next if position1.blank?

        article = Article.where(old_idi: position1.article_idi).first

        if !article.blank? && !section.blank?
          article.sections << section
          article.save!
        end
      end
    end
    true
  end

  def self.connect_articles_to_subsections
    OldPosition4.transaction do
      OldPosition4.all.each do |position4|
        subsection = Subsection.where(title: position4.position4).first

        position3 = OldPosition3.where(position3_idi: position4.position3_idi).first
        next if position3.blank?

        position2 = OldPosition2.where(position2_idi: position3.position2_idi).first
        next if position2.blank?

        position1 = OldPosition1.where(position1_idi: position2.position1_idi).first
        next if position1.blank?

        article = Article.where(old_idi: position1.article_idi).first

        if !article.blank? && !subsection.blank?
          article.subsections << subsection
          article.save!
        end
      end
    end
    true
  end

  def self.migrate_article_fields
    OldArticle.transaction do
      OldArticle.all.each do |old_article|
        article = Article.where(old_idi: old_article.article_idi).first
        next if article.blank?

        article.coauthors = old_article.coauthors
        article.publication_data = old_article.month_tp

        old_journal_title = old_article.journal
        unless old_journal_title.blank?
          old_journal_title = old_journal_title.gsub(/\s+/, ' ').strip

          journal = Journal.find_or_create_by!(title: old_journal_title)
          article.journal_id = journal.id
        end
        article.save
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
    connect_authors_to_articles

    connect_articles_to_chapters
    connect_articles_to_reviews
    connect_articles_to_sections
    connect_articles_to_subsections
  end

  # Additional actions

  def attach_files

  end

  def attach_files_action
    params[:file_list].each do |file|
      filename = File.basename(file.original_filename, '.*')
      old_article_id = filename.match(/^\d+/).to_s.to_i
      article = Article.where(old_idi: old_article_id).first
      raise 'Article not found' if article.blank?

      ArticleFile.create(article_id: article.id, file: file)
    end

    render json: {
        success: 0
    }
  end

end
