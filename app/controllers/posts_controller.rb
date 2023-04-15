class PostsController < ApplicationController

    def index
        @posts = Post.all.order("created_at DESC")
    end

    def new
        @post = Post.new
    end

    def create
        # Controller instance variables such as @post, can be accessed by the view
        @post = Post.new(check_params)
        if @post.save 
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private

    def check_params
        # Creates an instance of ActionController::Parameters with the key passed in require
        params.require(:post).permit(:title, :content)
    end

end
