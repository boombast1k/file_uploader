require 'spec_helper'

describe UsersController do
  context "user registration #create" do
    context "with valid data" do
      let(:params) {
        { user: { email: "mymail999@mail.my", password: '12345678', password_confirmation: '12345678' } }
      }

      before do
        User.delete_all
        post :create, params
      end

      context "assigns user" do

        it "kind of User" do
          expect(assigns(:user)).to be_kind_of User
        end

        it "persisted" do
          expect(assigns(:user).persisted?).to be true
        end
      end

      xit "redirect to uploads page" do
        expect(subject).to redirect_to uploads_path
      end
    end
  end

  context "user registration form #new" do
    it "render user form" do
      get :new
      expect(response).to render_template :new
    end
  end
end
