class CreateOauthProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :oauth_providers do |t|
      t.references :user, null: false, foreign_key: true
      t.string     :name
      t.string     :uid
      t.datetime   :confirmed_at
      t.string     :token
      t.boolean    :will_expire
      t.datetime   :expires_at
      t.string     :refresh_token

      t.timestamps
    end
  end
end
