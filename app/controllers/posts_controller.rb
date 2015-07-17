class PostsController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :show]
	def index
		@posts = Post.all.order('created_at DESC')
		# @post = Post.new
		@comment = Comment.new
	end

	def new
		@post = Post.new
	end 

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to blog_path, notice: "Your post has been created!"

		else 
			render :new
		end 
	end

	def show
		set_param
		
	end 


	def edit
		@post = Post.find(params[:id])
		redirect_to newpost_path

	end 

	def update
	end 

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to blog_path, alert: "your post was deleted"

	end 

	private

	def post_params
		params.require(:post).permit(:post, :title)
	end 

	def set_param
		@post = Post.find(params[:id])
	end 

end
