class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # o dependent destroy para quando apagarmos um restaurante apagar as reviews
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ['chinese', 'italian', 'japanese', 'french', 'belgian'] }
end
