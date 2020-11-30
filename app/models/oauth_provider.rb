class OauthProvider < ApplicationRecord
  belongs_to :user

  def self.from_omniauth(auth)
    oauth_provider = OauthProvider.find_or_create_by(name: auth.provider, uid: auth.uid) do |provider|
      if provider.user.nil?
        provider.user = User.find_or_create_by(email: auth.info.email) do |u|
          u.first_name = auth.info.first_name.present? ? auth.info.first_name : auth.info.name.split(' ').first
          u.last_name  = auth.info.last_name.present? ? auth.info.last_name : auth.info.name.split(' ').last
          u.password   = Devise.friendly_token[0,20]
        end
      end
    end

    oauth_provider.update(
      token:         auth.credentials.token,
      will_expire:   auth.credentials.expires,
      expires_at:    auth.credentials.expires_at,
      refresh_token: auth.credentials.refresh_token,
    )

    oauth_provider.user
  end
end
