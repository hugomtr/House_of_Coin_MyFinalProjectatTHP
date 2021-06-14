class CreateRealEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :real_estates do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.string :name
      t.text :description
      t.string :adress
      t.string :zipcode
      t.string :city
      t.string :geocode

      t.timestamps
    end
  end
end
