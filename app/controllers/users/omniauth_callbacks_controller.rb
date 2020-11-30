# frozen_string_literal: true
# :nocov:
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # More info at:
  # https://github.com/plataformatec/devise#omniauth
  # skip_before_action :verify_authenticity_token, only: :facebook

  def facebook
    _process_omniauth('facebook')
  end

  def twitter
    _process_omniauth('twitter')
  end

  def linkedin
    _process_omniauth('linkedin')
  end

  def github
    _process_omniauth('github')
  end

  def failure
    redirect_to root_path
  end

  # GET|POST /resource/auth/twitter
  def passthru
    super
  end

  protected

  def _process_omniauth(provider_name)
    @user = OauthProvider.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: provider_name.titleize) if is_navigational_format?
    else
      # session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: "Unable to Signup with #{provider_name.titleize}"
    end
  end

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
# :nocov:
