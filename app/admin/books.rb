ActiveAdmin.register Book do
  permit_params :title, :country, :language, :description, :publication_date, :cover,
                book_genres_attributes: %i[id genre_id book_id _destroy]

  show do
    attributes_table do
      @book = Book.find_by(id: params[:id])
      if @book.cover.attached?
        row :cover do
          image_tag @book.cover, width: "200px"
        end
      end
      row :title
      row :country
      row :language
      row :description
      row :publication_date
      if book.genres
        table_for book.genres do
          column 'Genres', &:name
        end
      end
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :country
    column :publication_date
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :country
      f.input :language
      f.input :description
      f.input :cover, as: :file
      f.has_many :book_genres, allow_destroy: true do |b|
        b.inputs 'Genres' do
          b.input :genre
        end
      end
      f.input :publication_date
    end
    actions
  end
end
