# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  count            :integer          default(0)
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
  has_one_attached :cover

  has_many :book_genres, dependent: :destroy
  has_many :author_books, dependent: :destroy
  has_many :genres, through: :book_genres
  has_many :books, through: :author_books
  has_many :authors, through: :author_books
  has_many :reserved_books, dependent: :destroy
  has_many :users, through: :reserved_books

  accepts_nested_attributes_for :book_genres, allow_destroy: true

  # == Validations ==========================================================
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }

  # == Scopes ===============================================================
  scope :in_stock, ->{ where('count > ?', 0) }
  scope :by_reserve, ->(user) { includes(:reserved_books).where(reserved_books: { user_id: user.id }) }

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
