class Admin::SettingsController < Admin::AdminBaseController

  def index
    @page_title  = 'Settings'
    
    _track_action()

    breadcrumb 'Settings', :admin_settings_path
  end

  def create
    setting_params.keys.each do |key|
      next if key.to_s == "site_logo"
      Setting.send("#{key}=", setting_params[key].strip) unless setting_params[key].nil?
    end

    _track_action('updated')

    redirect_to admin_settings_path, notice: "Setting was successfully updated."
  end

  private
    def setting_params
      params.require(:setting).permit(
        :site_title,
        :admin_email,
        :terms_and_conditions_url,
        :privacy_policy_url,
        :contact_us_url,
        :copyright_content,
        :primary_color,
        :primary_color_dark,
        :primary_color_light,
        :primary_color_muted,
        :secondary_color,
        :secondary_color_dark,
        :secondary_color_light,
        :secondary_color_muted,
      )
    end
end