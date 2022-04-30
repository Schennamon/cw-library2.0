class CreateBooks < ActiveRecord::Migration[7.0]

  def change
    create_table :books do |t|
      t.string :title
      t.string :country
      t.string :language
      t.text :description
      t.date :publication_date

      t.timestamps
    end
  end

end
