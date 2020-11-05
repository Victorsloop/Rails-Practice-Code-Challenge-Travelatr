class BloggersController < ApplicationController
    def index 
        @blogger = Blogger.all 
    end 
    ## This way we can see all the blogger and newly created ones
    def show 
        @blogger = Blogger.find(params[:id])
    end 

    def new 
        @blogger = Blogger.new
    end 

    def create 
        blogger = Blogger.create(blogger_params)
        if blogger.valid?
            redirect_to blogger_path(blogger)
        else
            flash[:blogger_errors] = blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end 

    private 
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end 
end 