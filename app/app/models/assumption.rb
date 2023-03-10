class Assumption < ApplicationRecord
    has_and_belongs_to_many :theories
    has_and_belongs_to_many :practices
    validates :name, presence: true
end
