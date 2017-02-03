class AddImportanceRateToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :importance_rate, :string
  end
end
