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

	def create
	# WITHOUT USING STRONG PARAMS SECURITY FEATURE
	#   @post = Post.new(params["post"])
	#   @post.save
	#   redirect_to post_path(@post)

	#WITH STRONG PARAMS FEATURE. WITH THIS, NO ONE CAN ALTER OUR PARAMETERS
	#   @post = Post.new(params.require(:post).permit(:title, :description))
  	#   @post.save
	#   redirect_to post_path(@post)

	#REFACTORING STRONG PARAMS USING POST_PARAMS PRIVATE METHOD
		@post = Post.new(post_params(:title, :description))
		@post.save
		redirect_to post_path(@post)
	end

	def update
		# WITHOUT USING STRONG PARAMS SECURITY FEATURE
		#   @post = Post.find(params[:id])
		#   @post.update(params["post"])
		#   redirect_to post_path(@post)

		#WITH STRONG PARAMS FEATURE. WITH THIS, NO ONE CAN ALTER OUR PARAMETERS
		# @post = Post.find(params[:id])
		# @post.update(params.require(:post).permit(:title))
		# redirect_to post_path(@post)

		#REFACTORING STRONG PARAMS USING POST_PARAMS PRIVATE METHOD
			@post = Post.find(params[:id])
			@post.update(post_params(:title))
			redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private
	#pre-refactored post_params method
	# def post_params
	# 	params.require(:post).permit(:title, :description)
	# end
	
	# refactored post_params methods with *args as argument
	def post_params(*args)
		params.require(:post).permit(*args)
	end

end
