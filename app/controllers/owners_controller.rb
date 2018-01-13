class OwnersController < ApplicationController

  def index
    @owners = Owner.all
    render json: @owners, status: :ok
    
   end
   def articles
   @articles = Article.find_by_owner_name(params[:owner_name])
    render json: @articles
  end
   def show
    @owner = Owner.find(params[:owner_name])
     render json: @owner
   end
   def new
   @owner = Owner.new
   end
   def create
    @owner = Owner.new(owners_params)
     
     respond_to do |format|
       if @owner.save
        format.html {redirect_to root_path}
        format.json { render json: @owner}
       else
        format.html {render "new"}
        format.json {render errors: @owner.errors.full_messages }
       end
      end 
    end
     
     private
     def owners_params
        params.require(:owner).permit(:owner_name)
     end
end
