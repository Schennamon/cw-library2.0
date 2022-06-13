class RenameFavoriteBookToReservedBook < ActiveRecord::Migration[7.0]
  def change
    rename_table :favorite_books, :reserved_books
  end
end
