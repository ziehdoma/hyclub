class PicturesController < ApplicationController
	def index
		@picture = Picture.all
	end 
	
	def new
	  	@picture = Picture.new
	end

  def create
  	@picture = Picture.new(picture_params)
  	if @picture.save
  			redirect_to @picture.gallery
  	else
     		render :new
   	end
  end
  
  def show
  end 
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to @picture.gallery

  end 


  def gallery
		@picture = Picture.last
	end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def picture_params
  params.require(:picture).permit(:image, :gallery_id)
end
 

end 

