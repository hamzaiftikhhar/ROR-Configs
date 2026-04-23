class RenameEmailAddressToEmail < ActiveRecord::Migration[8.1]
  def change
    rename_column :users, :email, :email
  end
end
