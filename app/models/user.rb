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

  validates_presence_of :name, :email

  enum default_payway: {
    creditcard: 1,
    invoice: 2
  }

  scope :search_by_params, ->(params) {
    search_by_name(params[:name])
    .search_by_email(params[:email])
  }

  scope :search_by_name, ->(name) {
    name.present? ? where('name LIKE ?', "%#{name}%") : all
  }

  scope :search_by_email, ->(email) {
    email.present? ? where('email LIKE ?', "%#{email}%") : all
  }

  def set_default_rank
    #TODO: 初期ランクを顧客に紐付け
  end
end
