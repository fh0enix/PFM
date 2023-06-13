class Operation < ApplicationRecord
  belongs_to :category
  validates :sum, numericality: true
  validates :description, :sum, :date, presence: true
end
