class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	#main..NOT REFACTORED
	# def create
	# 	@post = Post.new(params.require(:post).permit(:title, :description))
	# 	@post.save
	# 	redirect_to post_path(@post)
	#   end

	#refactor1
	# def create
	# 	@post = Post.new(post_params)
	# 	@post.save
	# 	redirect_to post_path(@post)
	#   end

	#refactor2 
	def create
		@post = Post.new(post_params(:title, :description))
		@post.save
		redirect_to post_path(@post)
	  end
	   
	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private
 
# def post_params
#   params.require(:post).permit(:title, :description)
# end

# We pass the permitted fields in as *args;
# this keeps `post_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action. This
# should come after the other methods
 
      def post_params(*args)
	      params.require(:post).permit(*args)
      end

end
