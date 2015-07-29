class CommentsController < ApplicationController
  
	def index
		@comments = Comment.all("created_at DESC")
	end
  def new
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new
  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(comment_params)
  	if @comment.save
  		redirect_to blog_path, notice: "Your comment has been posted!"

  	else 
  	 render :new
  	end 
  end

  def show
  	@comment = Comment.find(params[:id])
  end 

  def destroy
    
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to blog_path, alert: "your comment was deleted"

  	
  end

  def edit
  end

  private
  def comment_params
  	params.require(:comment).permit(:name, :body)
  end 
end


