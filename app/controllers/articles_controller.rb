class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @articles = @articles.joins(:chapters).where(chapters: {id: params[:chapter_id]}) unless params[:chapter_id].blank?
    @articles = @articles.joins(:reviews).where(reviews: {id: params[:review_id]}) unless params[:review_id].blank?
    @articles = @articles.joins(:sections).where(sections: {id: params[:section_id]}) unless params[:section_id].blank?
    @articles = @articles.joins(:subsections).where(subsections: {id: params[:subsection_id]}) unless params[:subsection_id].blank?

    @articles = @articles.joins(:author).where('lower(authors.last_name) LIKE ?', "%#{params[:author].mb_chars.downcase.to_s}%") unless params[:author].blank?
    @articles = @articles.where('lower(articles.title) LIKE ?', "%#{params[:title].mb_chars.downcase.to_s}%") unless params[:title].blank?
    @articles = @articles.uniq

    @total_results = @articles.length

    @articles = @articles.page(params[:page]).per(10)

    @chapters = Chapter.all
    @reviews = Chapter.where(id: params[:chapter_id]).first.try(:reviews) || []
    @sections = Review.where(id: params[:review_id]).first.try(:sections) || []
    @subsections = Section.where(id: params[:section_id]).first.try(:subsections) || []
  end

  def show
    @article = Article.where(id: params[:id]).first
  end

end
