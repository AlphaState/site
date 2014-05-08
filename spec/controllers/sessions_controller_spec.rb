require 'spec_helper'

describe SessionsController do
  describe 'GET #new' do
    it 'returns HTTP success' do
      get :new
      expect(response).to be_success
    end
  end

  context 'when there is a user' do
    before :each do
      @user = create :user
    end

    describe 'POST #create' do
      it 'authenticate the user if the email/password pair is correct' do
        post :create, email: @user.email, password: @user.password
        expect(response).to redirect_to(home_path)
        expect(session[:user_id]).to eq(@user.id)
      end

      it 'does not authenticate the user if the email is wrong' do
        post :create, email: "#{ @user.email }:)", password: @user.password
        expect(response).to render_template(:new)
        expect(session[:user_id]).to be_blank
      end

      it 'does not authenticate the user if the password is wrong' do
        post :create, email: @user.email, password: "#{ @user.password }:)"
        expect(response).to render_template(:new)
        expect(session[:user_id]).to be_blank
      end
    end

    context 'when the user is signed in' do
      before :each do
        controller.send :remember_current_user, @user
        expect(session[:user_id]).not_to be_blank
      end

      describe 'GET #destroy' do
        it 'closes the session of the current user' do
          get :destroy
          expect(response).to redirect_to(home_path)
          expect(session[:user_id]).to be_blank
        end
      end

      describe 'DELETE #destroy' do
        it 'closes the session of the current user' do
          delete :destroy
          expect(response).to redirect_to(home_path)
          expect(session[:user_id]).to be_blank
        end
      end
    end
  end
end
