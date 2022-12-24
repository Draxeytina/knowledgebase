class Trend < ApplicationRecord
  validates :session_id, presence: true
  validates :search, presence: true
end
