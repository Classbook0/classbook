class Curso < ApplicationRecord
  belongs_to :user
  has_many :note
end
