require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe 'POST #create' do
    before(:each) do
      @user ||= create(:user)
    end

    context 'when password is invalid' do
      it 'renders the page with error' do
        post :create, { email: @user.email, password: 'invalid' }

        expect(response).to render_template(:new)
        expect(flash[:alert]).to match(/^Email or Password is invalid/)
        expect(session[:user_id]).to be_nil
      end
    end

    context 'when password is valid' do
      it 'welcomes the user, sets the user in the session and redirects them to the home page' do
        post :create, { email: @user.email, password: @user.password }

        expect(flash[:notice]).to match(/^Logged in as #{@user.name}/)
        expect(controller.current_user).to eq @user
        expect(response).to redirect_to root_url
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'removes the session' do
      user = create(:user)
      session[:user_id] = user.id

      delete :destroy

      expect(response).to redirect_to root_url
      expect(flash[:notice]).to match(/^Signed Out/)
      expect(session[:user_id]).to be_nil
    end
  end
end
