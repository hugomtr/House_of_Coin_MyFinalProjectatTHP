class AddRealEstateIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :real_estate, index: true
  end
end
