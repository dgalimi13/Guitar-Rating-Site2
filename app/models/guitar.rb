class Guitar < ApplicationRecord
  belongs_to :make
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  def make_attributes=(attributes)
    make = Make.find_or_create_by(attributes) if !name.empty?
  end 
  
end
