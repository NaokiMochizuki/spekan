class Client < ApplicationRecord
  acts_as_paranoid
  has_many :users
  has_many :ranks

  after_create :create_default_rank

  def create_default_rank
    #TODO: デフォルトランクを生成
  end
end
