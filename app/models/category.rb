class Category < ApplicationRecord
    # Part 2, Step 4
    has_many :products, dependent: :destroy
    validates :name, presence: true
end
