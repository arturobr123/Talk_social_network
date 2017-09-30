class AreasController < ApplicationController
  before_action :find_area, only: [:update]

  def index
    @area = Area.new
    @areas = Area.all.nuevos
    
  # GET /posts/1
  # GET /posts/1.json
  end
  

  def destroy
    
    
  end

  def new
    @area = Post.new.decorate
  end

  def create

	 @area = current_user.areas.new(area_params)   


    respond_to do |format|
      if @area.save
        format.html { redirect_to @area, notice: 'Post was successfully created.' }
        format.js{render :show}
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
    

  end


  def update
    @areaB.goal = true


    respond_to do |format|
      if @areaB.save
        format.html
        format.js { render :action => "goalTrue" }
      end
    end
    
  end
 


  private
    def area_params
      params.require(:area).permit(:title, :user_id, :description)
    end

    def find_area
    @areaB = Area.find(params[:id])
    end



end
