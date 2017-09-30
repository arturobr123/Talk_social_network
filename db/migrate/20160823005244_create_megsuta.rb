class CreateMegsuta < ActiveRecord::Migration[5.0]
  def change
    create_table :megsuta do |t|
      t.integer :megusta
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
