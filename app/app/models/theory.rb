# frozen_string_literal: true

class Theory < ApplicationRecord
  has_and_belongs_to_many :assumptions

  has_rich_text :description
  validates :name, presence: true
end
