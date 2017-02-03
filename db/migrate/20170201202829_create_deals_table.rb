class CreateDealsTable < ActiveRecord::Migration
  def change
  	create_table :deals do |t|
  		t.string   :importance_rate
  		t.string   :title
  		t.datetime :starting_date
  		t.datetime :experation_date
  		t.string   :link
  		t.string   :content
      t.integer  :category_id
  	end
  end
end
