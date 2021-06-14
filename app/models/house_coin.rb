class HouseCoin < ApplicationRecord
  belongs_to :order
  belongs_to :real_estate
  belongs_to :user
end
