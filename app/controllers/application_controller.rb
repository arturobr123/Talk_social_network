class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout
  before_action :configurar_strong_params, if: :devise_controller?

  protected
	  def set_layout
	  	"application"
	  	
	  end
  
  def configurar_strong_params

  	devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  	
  end

  helper_method :changeArea
  def changeArea(numero)
    $global_area = numero
    puts "aaaaaaaaaaaaaaaaa"
     puts $global_area

     
    
  end

end
