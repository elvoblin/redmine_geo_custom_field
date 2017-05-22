Redmine::Plugin.register :redmine_geo_custom_field do
  name 'Redmine Geo Custom Field plugin'
  author 'elvoblin'
  description 'This is a plugin for Redmine which adds geographical coordinates custom field format'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

Rails.configuration.to_prepare do
  unless Redmine::FieldFormat.included_modules.include?(RedmineGeoCustomField::FieldFormatPatch)
    Redmine::FieldFormat.send(:include, RedmineGeoCustomField::FieldFormatPatch)
  end
end
