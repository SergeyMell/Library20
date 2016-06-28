ActiveAdmin.register Article do

  permit_params :title, chapter_ids: [], review_ids: [], section_ids: [], subsection_ids: []

  form do |f|
    f.inputs do
      f.input :author
      f.input :title
      f.input :year

      f.input :chapters, as: :select2_multiple, collection: Chapter.all
      f.input :reviews, as: :select2_multiple, collection: Review.all
      f.input :sections, as: :select2_multiple, collection: Section.all
      f.input :subsections, as: :select2_multiple, collection: Subsection.all
    end

    f.actions
  end


end
