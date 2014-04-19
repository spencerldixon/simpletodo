require 'spec_helper'

describe ListsController do
  context "When logged in" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user

      @list = FactoryGirl.create(:list, name: "Test List")
    end

    describe "on GET request to the Index action" do
      it "returns an array of lists specific to the current user" do
        first_list = FactoryGirl.create(:list, user: @user)
        second_list = FactoryGirl.create(:list, user: @user)

        get :index
        expect(assigns(:lists)).to match_array([first_list, second_list])
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "on GET request to the New action" do
      it "assigns a new list to @list" do
        get :new
        expect(assigns(:list)).to be_a_new(List)
      end

      it "renders the new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "on GET request to the Show action" do
      it "assigned the requested list to @list" do
        list = FactoryGirl.create(:list)
        get :show, id: list
        expect(assigns(:list)).to eq list
      end

      it "renders the :show template" do
        list = FactoryGirl.create(:list)
        get :show, id: list
        expect(response).to render_template :show
      end
    end

    describe "on GET request to the Edit action" do
      it "assigns the correct list to @list" do
        list = FactoryGirl.create(:list)
        get :edit, id: list
        expect(assigns(:list)).to eq list
      end

      it "renders the edit template" do
        list = FactoryGirl.create(:list)
        get :edit, id: list
        expect(response).to render_template :edit
      end
    end

    describe "on POST request to the Create action" do
      context "with valid attributes" do
        it "saves the new list to the database" do
          expect{
            post :create, list: FactoryGirl.attributes_for(:list)
            }.to change(List, :count).by(1)
        end
        it "redirects to the Show template" do
          post :create, list: FactoryGirl.attributes_for(:list)
          expect(response).to redirect_to list_path(assigns[:list])
        end
      end

      context "with invalid attributes" do
        it "does not save to the database" do
          expect{
            post :create, list: FactoryGirl.attributes_for(:invalid_list)
            }.to_not change(List, :count)
        end

        it "re-renders the New template" do
          post :create, list: FactoryGirl.attributes_for(:invalid_list)
          expect(response).to render_template :new
        end
      end
    end

    describe "on PATCH request to the Update action" do
      context "with valid attributes" do
        it "locates the requested @list" do
          patch :update, id: @list, list: FactoryGirl.attributes_for(:list)
          expect(assigns(:list)).to eq(@list)
        end

        it "changes the lists attributes" do
          patch :update, id: @list, list: FactoryGirl.attributes_for(:list, name: "Changed list name")
          @list.reload
          expect(@list.name).to eq("Changed list name")
        end

        it "redirects to the updated list" do
          patch :update, id: @list, list: FactoryGirl.attributes_for(:list)
          expect(response).to redirect_to @list
        end
      end

      context "with invalid attributes" do
        it "does not change the lists attributes" do
          patch :update, id: @list, list: FactoryGirl.attributes_for(:list, name: nil)
          @list.reload
          expect(@list.name).to_not eq(nil)
          expect(@list.name).to eq("Test List")
        end

        it "redirects to the edit template" do
          patch :update, id: @list, list: FactoryGirl.attributes_for(:invalid_list)
          expect(response).to render_template :edit
        end
      end
    end

    describe "on DELETE request to the Destroy action" do
      it "deletes the list" do
        expect{
          delete :destroy, id: @list
        }.to change(List, :count).by(-1)
      end

      it "redirects to the index action" do
        delete :destroy, id: @list
        expect(response).to redirect_to lists_path
      end
    end
  end

  context "When not logged in" do
  end
end
