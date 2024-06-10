class Client < ApplicationRecord
  acts_as_paranoid
  has_many :users
  has_many :ranks

  after_create :create_default_rank

  def create_default_rank
    ranks.create(name: '初期ランク', is_default: true, point_rate: 0)
  end
end
