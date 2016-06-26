class ArticlesController < ApplicationController

  def index
    @articles = Article.all.page(params[:page]).per(10)
    @chapters = Chapter.all
  end

end
