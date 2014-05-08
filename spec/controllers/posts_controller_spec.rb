require 'spec_helper'

describe PostsController do
  before do
    controller.stub(:current_user) { true }
  end

  describe 'GET #new' do
    it 'returns HTTP success' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    it 'renders #new if the entered data are incomplete' do
      post :create, post: { title: 'Hi, there!' }
      expect(response).to render_template(:new)
    end

    it 'creates a new post and displays it right after' do
      one = build :post
      expect{ post :create, post: one.attributes }.to change(Post, :count).by(1)
      expect(response).to redirect_to(assigns(:post))
    end
  end

  context 'when there are some posts' do
    before :each do
      @post = create :post
    end

    describe 'GET #index' do
      it 'fetches the posts and returns HTTP success' do
        get :index
        expect(assigns(:posts)).not_to be_empty
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'finds the selected post and returns HTTP success' do
        get :show, id: @post
        expect(assigns(:post)).to eq(@post)
        expect(response).to be_success
      end
    end

    describe 'GET #edit' do
      it 'returns HTTP success' do
        get :edit, id: @post
        expect(response).to be_success
      end
    end

    describe 'PATCH #update' do
      it 'redirect to #show' do
        patch :update, id: @post, post: {}
        expect(response).to redirect_to(@post)
      end
    end

    describe 'DELETE #destroy' do
      it 'removes the selected post and redirects to #index' do
        expect{ delete :destroy, id: @post }.to change(Post, :count).by(-1)
        expect(response).to redirect_to(posts_path)
      end
    end
  end
end
