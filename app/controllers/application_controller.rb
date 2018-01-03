class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :create_sidebar

  def create_sidebar
    @links = Article.all
    @list_tags = Tag.all
  end

end
