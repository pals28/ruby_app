class PostsController < ApplicationController

    def index
        @posts = Post.all.order("created_at DESC")
    end

    def new
        @post = Post.new
    end

    def create
        # Controller instance variables such as @post, can be accessed by the view
        @post = Post.new(post_params)
        if @post.save 
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        redirect_to root_path
    end

    private

    def post_params
        # Creates an instance of ActionController::Parameters with the key passed in require
        params.require(:post).permit(:title, :content)
    end

end
