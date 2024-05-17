class Client < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :sessions, through: :users
end
