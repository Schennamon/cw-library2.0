# == Schema Information
#
# Table name: author_genres
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#  genre_id   :integer          not null
#
# Indexes
#
#  index_author_genres_on_author_id  (author_id)
#  index_author_genres_on_genre_id   (genre_id)
#
# Foreign Keys
#
#  author_id  (author_id => authors.id)
#  genre_id   (genre_id => genres.id)
#
class AuthorGenre < ApplicationRecord

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================
  belongs_to :author
  belongs_to :genre

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
