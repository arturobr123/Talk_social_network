class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.references :like, foreign_key: true
      t.boolean :goal, default: false

      t.timestamps
    end
  end
end
