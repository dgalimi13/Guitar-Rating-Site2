class Guitar < ApplicationRecord
  belongs_to :make
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  validates :model, presence: true
  validate :not_a_duplicate

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

  def self.alpha
    order(:model)
  end

  def make_attributes=(attributes)
    self.make = Make.find_or_create_by(attributes) if !attributes['name'].empty?
    self.make
  end 

  def not_a_duplicate
    if Guitar.find_by(model: model, make_id: make_id)
      errors.add(:model, "has already been added for that make")
    end 
  end

  def model_and_make
    "#{model} - #{make.name}"
  end 

  def make_name
    make.try(:name)
  end

end
