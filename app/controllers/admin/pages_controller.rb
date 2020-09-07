class Admin::PagesController < Admin::AdminBaseController

  def dashboard
    @page_title  = 'Dashboard'
    @impressions = Ahoy::Event.order(time: :desc).first(10)
  end

  def utilities
    @page_title  = 'Utilities'
    @impressions = Ahoy::Event.order(time: :desc)
    
    breadcrumb 'Utilities', :utilities_admin_pages_path
  end
end