class GenresController < ApplicationController

  before_action :set_genre, only: :show

  def show
    @groups = @genre.book_genres
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
