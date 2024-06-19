class UserItem < ApplicationRecord
  has_many :user_item_selections, dependent: :destroy
  has_many :client_user_items, dependent: :destroy
  has_many :clients, through: :client_user_items

  enum format: {
    text_input: 1,
    sentence_input: 2,
    single_select: 3,
    multi_select: 4,
    date_select: 5,
  }

  # 独自の入力項目である場合のみclientとの紐付けを必須に
  validates :client_id, presence: true, if: -> { is_default }
  
end
