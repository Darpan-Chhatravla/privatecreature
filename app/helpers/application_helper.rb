module ApplicationHelper
	 def menu_class(c_name = "home", a_name = action_name)
    c_name = [c_name] if c_name.is_a? String
    a_name = [a_name] if a_name.is_a? String
    return ((a_name.include? action_name and c_name.include? controller_name) ? "Selected" : "")
  end
end
