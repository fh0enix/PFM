class Category < ApplicationRecord
    has_many :operations, dependent: :destroy
    validates :name, uniqueness: true
    validates :name, :description, presence: true
end
