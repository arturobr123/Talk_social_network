class DislikesController < ApplicationController

  def destroy
    
    
  end

  def create

    @postt = Post.find(params[:post_id])
    if @postt.already_likes?(current_user) == false && @postt.already_dislikes?(current_user) == false
      @dislike = @postt.dislikes.new()
      @dislike.user_id = current_user.id
     
      respond_to do |format|
        if @dislike.save
          format.html { redirect_to root_path, notice: 'Me gusta' }
          format.js { render :show }
        end
      end
    end
    

  end
 
  private
    def comment_params
      params.require(:dislike).permit(:dislike, :user_id)
    end
end
