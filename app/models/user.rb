class User < ApplicationRecord
  acts_as_paranoid
  belongs_to :client

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum default_payway: {
    creditcard: 1,
  }
end