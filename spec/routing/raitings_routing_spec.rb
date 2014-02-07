require "spec_helper"

describe RaitingsController do
  describe "routing" do

    it "routes to #index" do
      get("/raitings").should route_to("raitings#index")
    end

    it "routes to #new" do
      get("/raitings/new").should route_to("raitings#new")
    end

    it "routes to #show" do
      get("/raitings/1").should route_to("raitings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/raitings/1/edit").should route_to("raitings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/raitings").should route_to("raitings#create")
    end

    it "routes to #update" do
      put("/raitings/1").should route_to("raitings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/raitings/1").should route_to("raitings#destroy", :id => "1")
    end

  end
end
