class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @articles = Article.includes(:article_files, :author).all
    @conferences = current_user.conferences
  end

  def update

  end

end
