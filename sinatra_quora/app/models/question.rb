class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers #camino de ida hacia tabla answers.
  #:answers es un método que apunta a la tabla answers.
  belongs_to :user #camino de regreso hacia el usuario.
  #como es muchos a uno, user va en singular.
  validates :body, presence: true
end
