class TagsController < ApplicationController
 before_action :set_tag, only: [:show,:edit,:update,:destroy]
def index
 @tags = Tag.all
end 
def new
   @tag = Tag.new
  end
def create
   @tag = Tag.new(tag_params)
   if @tag.save
    redirect_to lists_path
    else
    render 'new'
   end
  end
  def destroy
  @tag.destroy
  end
  
  private 
   def tag_params
     params.require(:tag).permit(:items)
   end
   def set_tag
        @tag = Tag.find(params[:id])
    end 
   
end
