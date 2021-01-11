class AddColumnsToOffices < ActiveRecord::Migration[6.0]
  def change
    add_column :offices, :name, :string
    add_column :offices, :price, :integer
    add_column :offices, :active, :boolean
    add_column :offices, :description, :string
    add_column :offices, :address, :string
    add_column :offices, :latitude, :float
    add_column :offices, :longitude, :float
  end
end
