class CategoriesController < ApplicationController
  include CategoriesHelper

  skip_before_action :verify_authenticity_token

  def reviews_by_chapter
    chapter = Chapter.where(id: params[:chapter_id]).first
    raise 'Chapter not found' if chapter.blank?
    render_options(chapter.reviews, '#review_selector')
  rescue => e
    render_options([], '#review_selector')

  end

  def sections_by_review
    review = Review.where(id: params[:review_id]).first
    raise 'Review not found' if review.blank?
    render_options(review.sections, '#section_selector')
  rescue => e
    render_options([], '#section_selector')
  end

  def subsections_by_section
    section = Section.where(id: params[:section_id]).first
    raise 'Section not found' if section.blank?
    render_options(section.subsections, '#subsection_selector')
  rescue => e
    render_options([], '#subsection_selector')
  end

end
