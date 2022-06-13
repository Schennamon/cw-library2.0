module Users

  module ReservedBooks

    class Delete

      include BasicService

      attr_reader :user, :params

      def initialize(user, params)
        @user = user
        @params = params
      end

      def call
        with_contract(::Users::ReservedBooks::DeleteContract.new, params) do |attributes|
          reserved_book = ReservedBook.find_by(user: user, book_id: attributes[book_id])

          reserved_book.destroy
        end
      end

    end

  end

end
