class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  field :site_title,               default: "Kickstart App"
  field :admin_email,              default: "admin@example.com"
  field :terms_and_conditions_url, default: "https://..."
  field :privacy_policy_url,       default: "https://..."
  field :contact_us_url,           default: "mailto:..."
  field :copyright_content,        default: 'Copyright 2020 Kickstart'
  field :enable_omniauth,          defailt: 'false'

  field :primary_color,            default: "#00BAE0"
  field :primary_color_dark,       default: "#009ABA"
  field :primary_color_light,      default: "#a8e6ab"
  field :primary_color_muted,      default: "#e8f5e9"
  field :secondary_color,          default: "#4CAF50"
  field :secondary_color_dark,     default: "#3d8b40"
  field :secondary_color_light,    default: "#6ec071"
  field :secondary_color_muted,    default: "#E8F5E9"
end
