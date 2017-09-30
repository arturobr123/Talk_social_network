class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.decorate

  # GET /posts/1
  # GET /posts/1.json
  end
  
  def show
    
  end

  # GET /posts/new
  def new
    @post = Post.new.decorate
  end

  # GET /posts/1/edit
  def edit
  end

  def PhotoPostModal
    @post=Post.find(params[:idpost_param]).decorate

    if @post.photo_file_name != nil
      respond_to do |format|
      format.html
      format.js { render :action => "modalPicture" }
      end
    else
      respond_to do |format|
      format.html
      format.js { render :action => "modalWithOutPhoto" }
      end

    end
    
  end

  def modal
    @post=Post.find(params[:idpost_param])
    respond_to do |format|
    format.html
    format.js { render :action => "modaljs" }
    end
    
  end

  def modalShare
    @post=Post.find(params[:idpost_param])
    respond_to do |format|
    format.html
    format.js { render :action => "modalSharesjs" }
    end
    
  end

  def repost
    orig_post=Post.find(params[:id])
    if  orig_post.already_shares?(current_user) == false

      if(orig_post.repost_id!=nil) #saber si ya se habia compartido
        puts "post compartido"
        @post= Post.create(user_id:current_user.id, 
          body: orig_post.body,
          area: orig_post.area, 
          photo: orig_post.photo, 
          repost_id:orig_post.repost_id).decorate
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Post was successfully created.' }
          format.js { render :action => "sharejs" }
          format.json { render :show, status: :created, location: @post }
        
        end
      else
        if(orig_post) #primera vez que se comparte
          @post= Post.create(user_id:current_user.id, 
            body: orig_post.body,
            area: orig_post.area, 
            photo: orig_post.photo, 
            repost_id:orig_post.id).decorate
          respond_to do |format|
            format.html { redirect_to root_path, notice: 'Post was successfully created.' }
            format.js { render :action => "sharejs" }
            format.json { render :show, status: :created, location: @post }
        
          end
        
        end 

      end

    end
    
  end


  # POST /posts
  # POST /posts.json
  def create
    
    @post = current_user.posts.new(post_params).decorate
    @post.usuario = current_user.username #es lo de usuario, ya NO hace nade, si funciona, pero lo deje para saber
    @post.area = $global_area

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js { render :show }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body, :user_id,:area,:usuario, :photo )
    end
end