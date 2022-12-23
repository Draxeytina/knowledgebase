class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  include PgSearch::Model
  pg_search_scope :pg_search,
    against: [:title, :body],
    using: {
      tsearch: {dictionary: 'english' }
    }

  def self.search(search)
    return all unless search.present?

    pg_search(search)
  end
end
