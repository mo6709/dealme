class RemoveImportanceRateFromDeals < ActiveRecord::Migration
  def change
  	remove_column :deals, :importance_rate
  end
end
