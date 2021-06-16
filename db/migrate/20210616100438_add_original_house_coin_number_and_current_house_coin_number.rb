class AddOriginalHouseCoinNumberAndCurrentHouseCoinNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estates, :original_house_coin_number, :integer
    add_column :real_estates, :current_house_coin_number, :integer
  end
end
