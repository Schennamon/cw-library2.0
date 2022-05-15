class AuthorsController < ApplicationController

  before_action :set_author, only: :show

  def show; end

  def index
    @authors = Author.paginate(page: params[:page], per_page: 15)
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

end
