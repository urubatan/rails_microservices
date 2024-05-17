class User < ApplicationRecord
  belongs_to :client
  has_many :sessions, dependent: :destroy
  has_secure_password
end
