module Users

  module ReservedBooks

    class Create

      include BasicService

      attr_reader :user, :params

      def initialize(user, params)
        @user = user
        @params = params
      end

      def call
        with_contract(::Users::ReservedBooks::CreateContract.new, params) do |attributes|
          reserved_book = ReservedBook.new(attributes)
          reserved_book.user = user

          book = reserved_book.book

          book.update(count: book.count - 1) if reserved_book.save
        end
      end

    end

  end

end
