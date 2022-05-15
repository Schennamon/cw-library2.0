class BooksController < ApplicationController

  before_action :set_book, only: :show

  def show; end

  def index
    @books = Book.paginate(page: params[:page], per_page: 15)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

end
