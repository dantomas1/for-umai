require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe "GET index" do
    it "assigns @lists" do
      list = List.create(title: "Barber")
      get :index
      expect(assigns(:lists)).to eq([list])
    end

    it "renders the index template" do
      #owners = ["matz","gum"]
      get :index
      expect(response).to render_template("index")
    end
   end 
   describe "GET thrashpage" do
    it "render the thrashpage template" do
      get :thrashpage
       expect(response).to render_template("thrashpage")
     end
    end 

end
