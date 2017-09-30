class SharesController < ApplicationController
	def new
    @share = Shares.new
  end

  def index
    @postts = Post.find(params[:post_id])
    @shares = @postts.shares
  end

  def destroy
    @share.destroy
    
  end

  def create
    @postt = Post.find(params[:post_id])
    if @postt.already_shares?(current_user) == false

      
      @share = @postt.shares.new()
      @share.whoshare = current_user.username
      @share.user_id = current_user.id
    
      respond_to do |format|
        if @share.save
          format.html { redirect_to root_path, notice: 'Acabas de comentar.' }
          format.js { render :show }
          #format.json { render :show, status: :created, location: @post }
    
        end
      end

    end
    


  end
 
  private
    def share_params
      params.require(:share).permit(:whoshare,:user_id)
    end



end
