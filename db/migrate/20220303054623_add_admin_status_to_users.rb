class AddAdminStatusToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin_status, :boolean, default: false
  end
end
