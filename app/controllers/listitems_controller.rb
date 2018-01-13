class ListitemsController < ApplicationController
before_action :set_listitem, only: [:show,:edit,:update,:destroy,:thrash]

def new
   @listitem = Listitem.new
  end
def create
   @listitem = Listitem.new(listitem_params)
   if @listitem.save
    redirect_to lists_path
    else
    render 'new'
   end
  end
  def destroy
  @listitem.destroy
  redirect_to lists_path
  end
  def thrash
  if @listitem.state == "active"
    if @listitem.update_attributes(state: "thrashed")
     redirect_to thrashpage_lists_path
    else
     redirect_to lists_path
    end
   else
     if @listitem.update_attributes(state: "active")
      redirect_to lists_path
     else
      redirect_to thrashpage_lists_path
     end
   end
  end 
  private 
   def listitem_params
     params.require(:listitem).permit(:title,:description,:list_id,:tag_id)
   end
   def set_listitem
        @listitem = Listitem.find(params[:id])
    end
   
end
