# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.find_or_create_by!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

genres = ['Fantasy', 'Adventure', 'Romance', 'Contemporary', 'Dystopian', 'Mystery', 'Horror', 'Thriller', 'Paranormal',
          'Historical fiction', 'Science Fiction', 'Children’s', 'Memoir', 'Cooking', 'Art', 'Self-help / Personal', 'Development',
          'Motivational', 'Health', 'History', 'Travel', 'Guide / How-to', 'Families & Relationships', 'Humor']

genres.each do |genre|
  Genre.find_or_create_by!(name: genre)
end

books = ['In Search of Lost Time', 'Ulysses', 'Don Quixote', 'One Hundred Years', 'The Great Gatsby',
         'Moby Dick', 'War and Peace', 'Hamlet', 'The Odyssey', 'Madame Bovary', 'The Divine Comedy', 'Lolita',
         'The Brothers']

books.each_with_index do |key, index|
  book = Book.find_or_create_by!(title: key)
end
