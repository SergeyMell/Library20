ActiveAdmin.register Article do

  menu parent: 'Publications'

  permit_params :title, :author, :author_id, :year, :coauthors, :publication_data,
                :journal, :journal_id,
                chapter_ids: [], review_ids: [], section_ids: [], subsection_ids: []

  form do |f|
    f.inputs do
      f.input :author
      f.input :coauthors

      f.input :title
      f.input :year
      f.input :publication_data
      f.input :journal

      f.input :chapters, as: :select2_multiple, collection: Chapter.all
      f.input :reviews, as: :select2_multiple, collection: Review.all
      f.input :sections, as: :select2_multiple, collection: Section.all
      f.input :subsections, as: :select2_multiple, collection: Subsection.all
    end

    f.actions
  end


end
