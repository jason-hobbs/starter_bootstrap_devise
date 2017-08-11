class AddUnlockTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :unlock_token, :string
  end
end
