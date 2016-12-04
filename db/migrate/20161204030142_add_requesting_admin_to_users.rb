class AddRequestingAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :requesting_admin, :boolean
  end
end
