class AddCityCountryToWebsite < ActiveRecord::Migration[5.1]
  def change
    add_column :websites, :city, :string
    add_column :websites, :country, :string
  end
end
