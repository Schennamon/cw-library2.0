class HomeController < ApplicationController

  def index
    @genres = Genre.paginate(page: params[:page], per_page: 12)
  end

end
