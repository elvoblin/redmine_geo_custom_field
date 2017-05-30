Redmine::Plugin.register :redmine_geo_custom_field do
  name 'Redmine Geo Custom Field plugin'
  author 'elvoblin'
  description 'This is a plugin for Redmine which adds geographical coordinates custom field format'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  settings default: {}, partial: "settings/rgcf_settings"
end

Rails.configuration.to_prepare do
  unless Redmine::FieldFormat.included_modules.include?(RedmineGeoCustomField::FieldFormatPatch)
    Redmine::FieldFormat.send(:include, RedmineGeoCustomField::FieldFormatPatch)
  end
end

class Hooks < Redmine::Hook::ViewListener
  render_on(:view_layouts_base_html_head, :partial => 'layouts/redmine_geo_custom_field')
end

module RedmineGeoCustomField
  def self.gmap_api_url
    gmap_api_key = Setting[:plugin_redmine_geo_custom_field]['gmap_api_key']
    url = "https://maps.googleapis.com/maps/api/js"
    url << "?key=#{gmap_api_key} "if gmap_api_key.present?
    return url
  end
end

