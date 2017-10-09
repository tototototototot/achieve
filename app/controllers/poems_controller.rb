class PoemsController < ApplicationController
 def index
   @poems = Poem.all
 end

 def show
  	@poems = Poem.find(params[:id])
  	render json: @poems
 end




end
