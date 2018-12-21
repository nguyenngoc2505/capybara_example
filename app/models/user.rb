class User < ApplicationRecord
  validates :name, :age, presence: true
end
