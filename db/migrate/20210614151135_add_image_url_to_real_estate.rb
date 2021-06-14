class AddImageUrlToRealEstate < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estates , :image_urls, :string
  end
end
