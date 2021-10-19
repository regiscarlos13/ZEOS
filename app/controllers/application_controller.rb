class ApplicationController < ActionController::Base
    before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	layout :layout_by_resource
	before_action :current_department, unless: :devise_controller?
    
	def layout_by_resource
		if devise_controller?
			"devise"
		else
			"application"
		end
	end

	def current_department
		if current_user.department.tipo == 'admin'
			@current_department = Department.where(tipo: 'Departamento')
			@dpi = true
		else
			@current_department = Department.where(id: current_user.department.id)
			@dpi = false
		end
		
	end
	

	protected
  
	def configure_permitted_parameters
	  attributes = [:department_id]
	  devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
	  devise_parameter_sanitizer.permit(:account_update, keys: attributes)
	end
end
