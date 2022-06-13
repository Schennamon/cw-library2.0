module Users

  module ReservedBooks

    class CreateContract < ApplicationContract

      params do
        required(:book_id).filled(:integer)
      end

    end

  end

end
