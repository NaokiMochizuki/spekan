class User < ApplicationRecord
  acts_as_paranoid
  belongs_to :client
  has_one :user_rank, dependent: :destroy
  has_one :rank, through: :user_rank
  has_many :rank_records, dependent: :destroy
  has_many :point_records, dependent: :destroy

  after_create :set_default_rank
  before_destroy :settle_unpaid_amount!

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :email, :default_payway

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
    default_rank = client.ranks.find_by(is_default: true)
    create_user_rank(rank_id: default_rank.id)
  end

  def settle_unpaid_amount!
    #TODO: 未精算金額の精算を行い、精算不可の場合は例外を出す
  end

  # ポイントを加算する
  def get_point(new_point, eventable)
    ActiveRecord::Base.transaction do
      update!(point: point + new_point)
      point_records.increase.create!(value: new_point, eventable: eventable)
    end
  rescue => e
    logger.error e.message
    false
  end

  # ポイントを消費する
  def lost_point(new_point, eventable)
    ActiveRecord::Base.transaction do
      update!(point: point + new_point)
      point_records.decrease.create!(value: new_point, eventable: eventable)
    end
  rescue => e
    logger.error e.message
    false
  end
end
