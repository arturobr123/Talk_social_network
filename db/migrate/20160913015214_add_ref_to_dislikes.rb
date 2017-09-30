class AddRefToDislikes < ActiveRecord::Migration[5.0]
  def change
    add_reference :dislikes, :user, foreign_key: true
  end
end
