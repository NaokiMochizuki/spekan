class ClientUserItem < ApplicationRecord
  belongs_to :client
  belongs_to :user_item
end
