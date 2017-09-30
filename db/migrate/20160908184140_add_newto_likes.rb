class AddNewtoLikes < ActiveRecord::Migration[5.0]
  def change
  	add_reference :likes, :user, index:true ,foreign_key: true
  end
end
