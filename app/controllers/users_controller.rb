class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @articles = Article.includes(:article_files, :author).all
  end

  def update

  end

end
