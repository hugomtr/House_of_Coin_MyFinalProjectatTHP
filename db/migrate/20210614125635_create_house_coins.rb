class CreateHouseCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :house_coins do |t|
      t.references :order, foreign_key: true
      t.references :real_estate, foreign_key: true
      t.float :coin_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
