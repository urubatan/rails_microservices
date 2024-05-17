class Session < ApplicationRecord
  belongs_to :user
  attr_accessor :username, :password, :callback_url, :client_name
  default_scope { where(active:true) }
end
