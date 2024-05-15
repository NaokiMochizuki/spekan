class User < ApplicationRecord
  acts_as_paranoid
  belongs_to :client
  has_one :user_rank, dependent: :destroy
  has_one :rank, through: :user_rank

  after_create :set_default_rank

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum default_payway: {
    creditcard: 1,
  }

  def set_default_rank
    #TODO: 初期ランクを顧客に紐付け
  end
end
