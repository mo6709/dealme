class CreateUserDealsTable < ActiveRecord::Migration
  def change
  	create_table :user_deals do  |t|
  		t.integer :user_id
  		t.integer :deal_id
  	end
  end
end
