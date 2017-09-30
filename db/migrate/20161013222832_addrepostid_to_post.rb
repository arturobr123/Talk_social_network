class AddrepostidToPost < ActiveRecord::Migration[5.0]
  def self.up
    add_column :posts, :repost_id, :integer
  end
end
