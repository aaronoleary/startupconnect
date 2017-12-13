class Post < ApplicationRecord
  has_many :views, dependent: :destroy
  validates  :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 100}
  validates :tagline, presence: true, length:  {minimum: 10}
  validates :incentive, presence: true
  validates :contact, presence: true

  scope :approved, -> {
     where(:postreview => false)
   }
  scope :pending, -> {
    where(:postreview => true)
  }
end
