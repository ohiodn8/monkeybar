class AddAdminIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :admin_id, :integer
    add_index :posts, :admin_id
  end
end
