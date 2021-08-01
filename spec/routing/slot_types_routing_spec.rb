require "rails_helper"

RSpec.describe SlotTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/slot_types").to route_to("slot_types#index")
    end

    it "routes to #new" do
      expect(get: "/slot_types/new").to route_to("slot_types#new")
    end

    it "routes to #show" do
      expect(get: "/slot_types/1").to route_to("slot_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/slot_types/1/edit").to route_to("slot_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/slot_types").to route_to("slot_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/slot_types/1").to route_to("slot_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/slot_types/1").to route_to("slot_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/slot_types/1").to route_to("slot_types#destroy", id: "1")
    end
  end
end
