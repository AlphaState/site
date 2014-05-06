require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods

  setup do
    @post = create(:post)
  end

  test 'should show all records' do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test 'should offer to create a new record' do
    get :new
    assert_response :success
  end

  test 'should create a new record' do
    assert_difference('Post.count') do
      post :create, post: {
        title: @post.title,
        author: @post.author,
        description: @post.description,
        content: @post.content,
        address: generate(:post_address)
      }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test 'should show the selected record' do
    get :show, id: @post
    assert_response :success
  end

  test 'should offer to edit the selected record' do
    get :edit, id: @post
    assert_response :success
  end

  test 'should update the selected record' do
    patch :update, id: @post, post: {
      title: @post.title,
      author: @post.author,
      description: @post.description,
      content: @post.content,
      address: @post.address
    }
    assert_redirected_to post_path(assigns(:post))
  end

  test 'should destroy the selected record' do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
