class Client < ApplicationRecord
  acts_as_paranoid
  has_many :users
  has_many :ranks
  has_one :point_setting
  has_many :client_user_items
  has_many :user_items, through: :client_user_items

  after_create :create_default_rank, :create_point_setting

  def create_default_rank
    ranks.create(name: '初期ランク', is_default: true, point_rate: 0)
  end

  def create_default_point_setting
    point_setting.create()
  end

  def is_active_user_item?(user_item)
    client_user_items.exists?(user_item_id: user_item.id)
  end
end
