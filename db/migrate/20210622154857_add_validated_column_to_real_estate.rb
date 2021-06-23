class AddValidatedColumnToRealEstate < ActiveRecord::Migration[5.2]
  def change
    add_column :real_estates, :validated?, :boolean, :default => false
  end
end
