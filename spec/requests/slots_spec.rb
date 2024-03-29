 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/slots", type: :request do
  # Slot. As you add validations to Slot, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Slot.create! valid_attributes
      get slots_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      slot = Slot.create! valid_attributes
      get slot_url(slot)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_slot_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      slot = Slot.create! valid_attributes
      get edit_slot_url(slot)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Slot" do
        expect {
          post slots_url, params: { slot: valid_attributes }
        }.to change(Slot, :count).by(1)
      end

      it "redirects to the created slot" do
        post slots_url, params: { slot: valid_attributes }
        expect(response).to redirect_to(slot_url(Slot.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Slot" do
        expect {
          post slots_url, params: { slot: invalid_attributes }
        }.to change(Slot, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post slots_url, params: { slot: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested slot" do
        slot = Slot.create! valid_attributes
        patch slot_url(slot), params: { slot: new_attributes }
        slot.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the slot" do
        slot = Slot.create! valid_attributes
        patch slot_url(slot), params: { slot: new_attributes }
        slot.reload
        expect(response).to redirect_to(slot_url(slot))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        slot = Slot.create! valid_attributes
        patch slot_url(slot), params: { slot: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested slot" do
      slot = Slot.create! valid_attributes
      expect {
        delete slot_url(slot)
      }.to change(Slot, :count).by(-1)
    end

    it "redirects to the slots list" do
      slot = Slot.create! valid_attributes
      delete slot_url(slot)
      expect(response).to redirect_to(slots_url)
    end
  end
end
