class RedmineGeoCustomFieldController < ApplicationController

  def show_modal_window
    @value = params[:custom_field_value]
    @cf = CustomField.find(params[:custom_field_id])
  end

  def edit_modal_window
    @cf = CustomField.find(params[:custom_field_id])
    @value = params[:custom_field_value]
    @default_value = "#{@cf.rgc_default_latitude}, #{@cf.rgc_default_longtitude}" if @value.blank?
  end
end
