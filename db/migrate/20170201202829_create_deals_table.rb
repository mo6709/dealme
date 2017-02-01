class CreateDealsTable < ActiveRecord::Migration
  def change
  	create_table :deals do |t|
  		t.integer  :importance_rate
  		t.string   :title
  		t.datetime :starting_date
  		t.datetime :experation_date
  		t.string   :link
  		t.string   :content 
  	end
  end
end
