require 'test_helper'

class PhonecallsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:phonecalls)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_phonecall
    assert_difference('Phonecall.count') do
      post :create, :phonecall => { }
    end

    assert_redirected_to phonecall_path(assigns(:phonecall))
  end

  def test_should_show_phonecall
    get :show, :id => phonecalls(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => phonecalls(:one).id
    assert_response :success
  end

  def test_should_update_phonecall
    put :update, :id => phonecalls(:one).id, :phonecall => { }
    assert_redirected_to phonecall_path(assigns(:phonecall))
  end

  def test_should_destroy_phonecall
    assert_difference('Phonecall.count', -1) do
      delete :destroy, :id => phonecalls(:one).id
    end

    assert_redirected_to phonecalls_path
  end
end
