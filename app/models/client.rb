class Client < ApplicationRecord
  acts_as_paranoid
  has_many :users

end