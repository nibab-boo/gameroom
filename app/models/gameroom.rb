class Gameroom < ApplicationRecord
  has_many :moves, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
