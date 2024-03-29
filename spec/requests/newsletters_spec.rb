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

RSpec.describe "/newsletters", type: :request do
  # Newsletter. As you add validations to Newsletter, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Newsletter.create! valid_attributes
      get newsletters_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      newsletter = Newsletter.create! valid_attributes
      get newsletter_url(newsletter)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_newsletter_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      newsletter = Newsletter.create! valid_attributes
      get edit_newsletter_url(newsletter)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Newsletter" do
        expect {
          post newsletters_url, params: { newsletter: valid_attributes }
        }.to change(Newsletter, :count).by(1)
      end

      it "redirects to the created newsletter" do
        post newsletters_url, params: { newsletter: valid_attributes }
        expect(response).to redirect_to(newsletter_url(Newsletter.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Newsletter" do
        expect {
          post newsletters_url, params: { newsletter: invalid_attributes }
        }.to change(Newsletter, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post newsletters_url, params: { newsletter: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested newsletter" do
        newsletter = Newsletter.create! valid_attributes
        patch newsletter_url(newsletter), params: { newsletter: new_attributes }
        newsletter.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the newsletter" do
        newsletter = Newsletter.create! valid_attributes
        patch newsletter_url(newsletter), params: { newsletter: new_attributes }
        newsletter.reload
        expect(response).to redirect_to(newsletter_url(newsletter))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        newsletter = Newsletter.create! valid_attributes
        patch newsletter_url(newsletter), params: { newsletter: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested newsletter" do
      newsletter = Newsletter.create! valid_attributes
      expect {
        delete newsletter_url(newsletter)
      }.to change(Newsletter, :count).by(-1)
    end

    it "redirects to the newsletters list" do
      newsletter = Newsletter.create! valid_attributes
      delete newsletter_url(newsletter)
      expect(response).to redirect_to(newsletters_url)
    end
  end
end
