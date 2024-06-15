class PointSetting < ApplicationRecord
  belongs_to :client

  validates :rate, presence: true, if: :is_valid?
  validates :valid_days, presence: true, if: :is_valid?
end

