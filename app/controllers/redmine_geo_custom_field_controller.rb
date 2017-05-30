class RedmineGeoCustomFieldController < ApplicationController

  def modal_window
    @value = params[:custom_field_value]
    @cf = CustomField.find(params[:custom_field_id])
  end
end
