class GalleriesController < ApplicationController

	def index
		@galleries = Gallery.all
	end

	def new
		@gallery = Gallery.new(params[:id])
	end

	def show
		@picture = Picture.new
		@gallery = Gallery.find(params[:id])
	end

	def edit
	end

	def create
		@gallery = Gallery.new(event: params[:gallery][:event])
		if @gallery.save
			redirect_to @gallery
		else 
			render :new
		end 
	end

	def update
	end

	def destroy
		@gallery = Gallery.find(params[:id])
		@gallery.destroy
		redirect_to galleries_path

	end

end
