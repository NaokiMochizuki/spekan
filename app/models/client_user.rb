class ClientUser < ApplicationRecord
  has_secure_password
  acts_as_paranoid
  belongs_to :client

  enum role: {
    master: 1,
  }
end
