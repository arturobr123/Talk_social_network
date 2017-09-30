class MainController < ApplicationController
 
  def home
  	@post= Post.new
    @posts= Post.all.nuevos.paginate(page:params[:page], per_page:7)
    @postsFriends= Post.all_for_user(current_user).nuevos.paginate(page:params[:page], per_page:7)
    @postsFiltrados= Post.all_for_area($global_area).nuevos.paginate(page:params[:page], per_page:7)
    @postss = filtrar.decorate

  end

  def unregistered
  end

  helper_method :changeArea
  def changeArea
    $global_area = params[:my_param].to_f
    $global_area_name = params[:name]
    puts "estoy cambiando de area"
    puts $global_area
    redirect_to root_path
    
  end

  

  protected
	  def set_layout
	  	return "landing" if action_name == "unregistered"
	  	super
	  	
	  end


  def filtrar
    
    if $global_area == nil  #al abrir por 1ra vez , que muestre todos.
      return @posts
    end 

    if $global_area == "all" && $global_area != nil 
      return @posts
    end

    if $global_area == 1 && $global_area != nil 
      return @postsFriends
    end

    return @postsFiltrados
    
  end





end
