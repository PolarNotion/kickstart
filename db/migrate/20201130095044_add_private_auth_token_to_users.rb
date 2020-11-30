class AddPrivateAuthTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :private_auth_token, :string
  end
end
