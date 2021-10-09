class Guitar < ApplicationRecord
  belongs_to :make
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  def make_attributes=(attributes)
    self.make = Make.find_or_create_by(attributes) if !attributes['name'].empty?
    self.make
  end 

  def make_name
    make.try(:name)
  end

end
