ActiveAdmin.register Author do
  permit_params :first_name, :last_name, :country, :date_of_birth, author_genres_attributes: %i[id author_id genre_id _destroy],
                                                                   author_books_attributes: %i[id author_id book_id]

  show do
    attributes_table do
      @author = Author.find_by(id: params[:id])
      row :first_name
      row :last_name
      row :country
      row :date_of_birth
      if @author.genres
        table_for @author.genres do
          column 'Genres', &:name
        end
      end
      if @author.books
        table_for @author.books do
          column 'Books', &:title
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :country
      f.input :date_of_birth
      f.has_many :author_genres, allow_destroy: true do |a|
        a.inputs 'Genres' do
          a.input :genre
        end
      end
      f.has_many :author_books, allow_destroy: true do |a|
        a.inputs 'Books' do
          a.input :book
        end
      end
      actions
    end
  end
end
