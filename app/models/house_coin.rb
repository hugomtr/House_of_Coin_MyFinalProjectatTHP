class HouseCoin < ApplicationRecord
  belongs_to :order
  belongs_to :realestate
  belongs_to :user
end
