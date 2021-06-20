class Message < ApplicationRecord
  belongs_to :user
  belongs_to :real_estate
  validates :body, presence: true
end
