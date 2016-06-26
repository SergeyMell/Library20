class ArticlesController < ApplicationController

  def index
    @articles = Article.all.page(params[:page]).per(10)
    @chapters = Chapter.all
    @reviews = Chapter.where(id: params[:chapter_id]).first.try(:reviews) || []
    @sections = Review.where(id: params[:review_id]).first.try(:sections) || []
    @subsections = Section.where(id: params[:section_id]).first.try(:subsections) || []

    puts params
  end

end
