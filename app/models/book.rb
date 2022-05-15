# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  country          :string
#  description      :text
#  language         :string
#  publication_date :date
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Book < ApplicationRecord

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================
  has_many :book_genres, dependent: :destroy
  has_many :author_books, dependent: :destroy
  has_many :genres, through: :book_genres
  has_many :books, through: :author_books
  has_many :authors, through: :author_books

  accepts_nested_attributes_for :book_genres, allow_destroy: true

  # == Validations ==========================================================
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
