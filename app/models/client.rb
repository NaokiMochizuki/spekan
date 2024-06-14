class Client < ApplicationRecord
  acts_as_paranoid
  has_many :users
  has_many :ranks
  has_one :point_setting

  after_create :create_default_rank, :create_point_setting

  def create_default_rank
    ranks.create(name: '初期ランク', is_default: true, point_rate: 0)
  end

  def create_default_point_setting
    point_setting.create()
  end
end
