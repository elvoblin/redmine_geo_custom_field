module RedmineGeoCustomField
  module FieldFormatPatch
    class GeoCoords < Redmine::FieldFormat::Unbounded
      add 'geo_coords'
      self.field_attributes :rgc_display_type
      self.form_partial = 'custom_fields/formats/geo_coords'

      def label
        'redmine_geo_custom_field.label_for_geo_coords'
      end

      def validate_single_value(custom_field, value, customized=nil)
        errs = []
        value = value.to_s
        unless value =~ /^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$/
          errs << ::I18n.t('redmine_geo_custom_field.invalid_coordinates')
        end
        errs
      end

      def formatted_value(view, custom_field, value, customized=nil, html=false)
        casted = value.to_s
        if html
          latitude, longtitude = value.split(',').map(&:to_f)

          case custom_field.rgc_display_type
          when "google_map_website"
            return view.link_to casted, "http://maps.google.com/?q=#{latitude},#{longtitude}", target: "_blank"
          when "string"
            casted
          else
            casted
          end
        else
          casted
        end
      end

      def display_types
        [
          [l('redmine_geo_custom_field.display_types.string'), 'string'],
          [l('redmine_geo_custom_field.display_types.google_map_website'), 'google_map_website']
        ]
      end

    end
  end
end
