class Theory < ApplicationRecord
    has_and_belongs_to_many :assumptions

    validates :name, presence: true
end
