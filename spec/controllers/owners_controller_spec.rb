require 'rails_helper'

RSpec.describe OwnersController, type: :controller do
context "JSON" do
  describe "GET index" do
    it "assigns @owners" do
      owner = Owner.create(owner_name: "matz")
      get :index
      expect(assigns(:owners)).to eq([owner])
    end
    
  end
 end 
end
