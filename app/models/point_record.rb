class PointRecord < ApplicationRecord
  belongs_to :user
  belongs_to :eventable, polymorphic: true
  
  enum record_type: {
    increase: 1,
    decrease: 2
  }
end
