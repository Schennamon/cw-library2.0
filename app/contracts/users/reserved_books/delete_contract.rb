module Users

  module ReservedBooks

    class DeleteContract < ApplicationContract

      params do
        required(:book_id).filled(:integer)
      end

    end

  end

end
