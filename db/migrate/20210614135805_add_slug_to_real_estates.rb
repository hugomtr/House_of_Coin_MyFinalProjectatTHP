class AddSlugToRealEstates < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estates, :slug, :string
    add_index :real_estates, :slug, unique: true
  end
end
