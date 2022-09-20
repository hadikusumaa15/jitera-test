class Api::UnitConvertersController < Api::BaseController
  def index
    @current_unit = params[:current_unit].to_s.downcase
    @current_value = params[:current_value].to_f
    @desired_unit = params[:desired_unit].to_s.downcase
    @desired_value = Unitwise(@current_value, @current_unit).convert_to(@desired_unit).to_f rescue @error_message = 'Conversion Error'
  end
end
  