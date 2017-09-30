class CommentsController < ApplicationController
  def new
    @comment = Comments.new
  end

  def index
    @postts = Post.find(params[:post_id])
    @Comments = @postts.comments

  end

  def show
    
  end

  def moreComments
    @postt = Post.find(params[:cualPost])
    if @postt.repost_id != nil
       @comentarios = Post.find(@postt.repost_id).comments.paginate(page:params[:page], per_page:3)
    else
       @comentarios = @postt.comments.paginate(page:params[:page], per_page:3)
    end
   

   respond_to do |format|
    format.html { redirect_to root_path }
    format.js {render :action => "moreComments" }
   end
    
  end


  def destroy
    @comment.destroy
    
  end

  def create

    @postt = Post.find(params[:post_id])

    if @postt.repost_id != nil
      @sharePost = Post.find(@postt.repost_id)
      @comment = @sharePost.comments.new(comment_params)
      @comment.commenter = current_user.username
      @comment.user_id = current_user.id
    else
      @comment = @postt.comments.new(comment_params)
      @comment.commenter = current_user.username
      @comment.user_id = current_user.id
    end


    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'Acabas de comentar.' }
        format.js { render :show }
        #format.json { render :show, status: :created, location: @post }
  
      end
    end
    

  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter,:user_id ,:body)
    end
end



