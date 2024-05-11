class ClientUser < ApplicationRecord
  acts_as_paranoid
  belongs_to :client
end
