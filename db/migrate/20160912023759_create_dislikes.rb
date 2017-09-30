class CreateDislikes < ActiveRecord::Migration[5.0]
  def change
    create_table :dislikes do |t|
      t.integer :dislike
      t.references :post, index:true ,foreign_key: true

      t.timestamps
    end
  end
end
