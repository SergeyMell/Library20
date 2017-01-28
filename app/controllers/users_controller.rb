class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @articles = Article.all
  end

  def update

  end

end
