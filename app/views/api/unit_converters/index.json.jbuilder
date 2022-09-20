if @error_message.blank?
  json.current_value @current_value
  json.current_unit @current_unit
  json.desired_value @desired_value
  json.desired_unit @desired_unit
else
  json.error_message @error_message
end
