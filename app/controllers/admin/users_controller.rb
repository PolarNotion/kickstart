class Admin::UsersController < Admin::AdminBaseController
  
  def index
    @page_title      = 'Users'
    @meta_page_title = 'All Users'
    @users           = User.order(:created_at).contains(params[:q])
    @users           = @users.page params[:page]

    _track_action()

    breadcrumb 'Users', :admin_users_path
  end

  def deactivate
    user = User.find(params[:id])

    if user.deactivate!
      redirect_to admin_users_path, notice: "User #{user.id} is deactivated."
    else
      redirect_to admin_users_path, alert: "Oh no! User #{user.id} could not be deactivated."
    end
  end

  def activate
    user = User.find(params[:id])

    if user.activate!
      redirect_to admin_users_path, notice: "User #{user.id} is activated."
    else
      redirect_to admin_users_path, alert: "Oh no! User #{user.id} could not be activated."
    end
  end
end
