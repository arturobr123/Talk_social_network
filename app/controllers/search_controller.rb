class SearchController < ApplicationController
  def create
  	palabra= "%#{params[:keyword]}%"

  	#@cosas = Post.where("body LIKE ? OR usuario LIKE ?", palabra,palabra).decorate
    @cosas = User.where("username LIKE ? ",palabra)
  	
  	respond_to do |format|
  		format.html{redirect_to root_path}
  		format.json {render json: @cosas}
  		format.js
  	end

  end
end
