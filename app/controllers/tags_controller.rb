class TagsController < ApplicationController

  before_action :require_login, only: [:destroy]

  def index
    @tag = Tag.all
  end

  def show
    @tag = Tag.find_by(id: params[:id])
  end
end
