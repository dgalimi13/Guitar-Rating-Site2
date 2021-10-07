class User < ApplicationRecord
    has_many :reviews
    has_many :guitars, through :reviews
end
