class ListsController < ApplicationController
  before_action :set_list, only: [:show,:edit,:update,:destroy,:thrash]

 def index
  @lists = List.all
  end
  def show
  end
  def new
   @list = List.new
  end
  def create
   @list = List.new(list_params)
   if @list.save
    redirect_to lists_path
    else
    render 'new'
   end
   def edit
   end
  end
  def destroy
    @list.destroy
    redirect_to lists_path
  end
  def thrash
   if @list.state == "active" 
     if @list.update_attributes(state: "thrashed")
      redirect_to thrashpage_lists_path
     else
      redirect_to lists_path
     end
    else
     if @list.update_attributes(state: "active")
      redirect_to lists_path
     else
      redirect_to thrashpage_lists_path
     end 
    end
  end 
  def thrashpage
    @lists = List.all
   end 
  
  private 
   def list_params
     params.require(:list).permit(:title)
   end
   def set_list
        @list = List.find(params[:id])
    end
  
end
