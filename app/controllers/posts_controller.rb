class PostsController < ApplicationController

    before_action :get_post, only: [:show, :update, :edit, :destroy]

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
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit 
    end

    def destroy
        @post.destroy

        redirect_to root_path
    end

    private

    def post_params
        # Creates an instance of ActionController::Parameters with the key passed in require
        params.require(:post).permit(:title, :content)
    end

    def get_post
        @post = Post.find(params[:id])
    end

end
