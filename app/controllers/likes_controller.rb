class LikesController < ApplicationController
  
  def index
    @postt = Post.find(params[:id_del_post])
    @likes = @postt.likes.all
  
  end

  def destroy
    
    
  end

  def create

    @postt = Post.find(params[:post_id])
    if @postt.already_likes?(current_user) == false && @postt.already_dislikes?(current_user) == false
      @like = @postt.likes.new()
      @like.user_id = current_user.id
     
      respond_to do |format|
        if @like.save
          format.html { redirect_to root_path, notice: 'Me gusta' }
          format.js { render :show }
        end
      end
    end
    
    
  end
 
  private
    def like_params
      params.require(:like).permit(:like, :user_id)
    end
end
