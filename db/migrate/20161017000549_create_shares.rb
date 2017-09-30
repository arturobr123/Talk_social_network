class CreateShares < ActiveRecord::Migration[5.0]
  def change
    create_table :shares do |t|
      t.string :whoshare
      t.references :post,index:true,foreign_key: true
      t.references :user,index:true, foreign_key: true

      t.timestamps
    end
  end
end
