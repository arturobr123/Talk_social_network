class VotesController < ApplicationController

  def index
    
  
  end

  def destroy
    
    
  end

  def create

    @area = Area.find(params[:area_id])


    if @area.votes.count <100 and @area.goal == false #checa si aun no llega al limite

      if @area.already_votes?(current_user) == false #checa si current_user ya dio voto
        @vote = @area.votes.new() #crea el nuevo voto
        @vote.user_id = current_user.id
       
        respond_to do |format|
          if @vote.save
            format.html { redirect_to root_path, notice: 'Me gusta' }
            format.js { render :show }
          end
        end
      end

    else #Si ya sobrepaso el limite, da click que esta en el parcial del area y le da TRUE a goal
          #con eso ya se ingresa a las areas
      if @area.votes ==false

        @vote = @area.votes.new()
        @vote.user_id = current_user.id
         
          respond_to do |format|
            if @vote.save
              format.html { redirect_to root_path, notice: 'Me gusta' }
              format.js { render :clickGoalTrue }
            end
          end

      end

    end
    


  end
    
    
 
  private
    def comment_params
      params.require(:vote).permit(:vote, :user_id)
    end


end
