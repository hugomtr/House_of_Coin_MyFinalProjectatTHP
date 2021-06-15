class RealEstate < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :housecoins

  after_create :real_estate_announce

  private
  def announce_validation
    AdminMailer.announce_validation(self).deliver_now
  end

end
