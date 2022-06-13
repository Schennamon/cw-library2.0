# == Schema Information
#
# Table name: authors
#
#  id            :integer          not null, primary key
#  country       :string
#  date_of_birth :date
#  first_name    :string
#  last_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Author < ApplicationRecord

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================
  has_many :author_genres, dependent: :destroy
  has_many :author_books, dependent: :destroy
  has_many :genres, through: :author_genres
  has_many :books, through: :author_books

  accepts_nested_attributes_for :author_genres, allow_destroy: true
  accepts_nested_attributes_for :author_books, allow_destroy: true

  # == Validations ==========================================================
  validates :first_name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 30 }

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================
  def full_name
    "#{first_name} #{last_name}"
  end
  # == Instance Methods =====================================================

end
