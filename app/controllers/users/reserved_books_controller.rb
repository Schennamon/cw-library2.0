module Users

  class ReservedBooksController < ApplicationController

    before_action :authenticate_user!

    def index
      @books = Book.by_reserve(current_user).paginate(page: params[:page], per_page: 15)
    end

    def create
      command = ::Users::ReservedBooks::Create.call(current_user, params.to_unsafe_hash)

      redirect_to books_path
    end

    def destroy
      command = ::Users::ReservedBooks::Delete.call(current_user, params.to_unsafe_hash)

      redirect_to books_path
    end

  end

end
