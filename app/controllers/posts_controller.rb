class PostsController < ApplicationController
    def index 
        @post = Post.all 
    end 
    ## This way we can see all the blogger and newly created ones
    def show 
        @post = Post.find(params[:id])
        if params[:like]
            @post.likes +=1 
            @post.save
        end
    end 

    def new 
        @post = Post.new
    end 

    def create 
        post = Post.create(post_params)
        if post.valid?
            redirect_to blogger_path(post)
        else
            flash[:post_errors] = post.errors.full_messages
            redirect_to new_post_path
        end
    end 

    def edit
        @post = Post.find(params[:id])
    end
    
    def update 
        @post = Post.find(params[:id])
       if @post.update(post_params)
        redirect_to post_path(@post)
       else redirect_to edit_post_path
       end
    end

    private 
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end 
end 

