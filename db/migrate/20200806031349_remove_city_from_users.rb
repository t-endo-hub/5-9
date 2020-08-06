class RemoveCityFromUsers < ActiveRecord::Migration[5.2]
  def change

    remove_column :users, :postcode, :integer
    remove_column :users, :prefecture_code, :integer
    remove_column :users, :address_city, :string
    remove_column :users, :address_street, :string
  end
end
