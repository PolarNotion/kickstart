class ApplicationController < ActionController::Base
  before_action :_ensure_auth_token

  private

  def _ensure_auth_token
    if params[:auth].present?
      user = User.find_by(private_auth_token: params[:auth])

      sign_in user if user.present?
    end
  end

  def _track_action(name='viewed', obj=nil)
    data = obj.present? ? request.path_parameters.merge(type: obj.class.name, id: obj.id) : request.path_parameters

    ahoy.track name, data
  end
end
