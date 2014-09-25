require 'test_helper'

class ThoughtsControllerTest < ActionController::TestCase
  def test_create_invalid
    Thought.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Thought.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_update_invalid
    Thought.any_instance.stubs(:valid?).returns(false)
    put :update, id: Thought.first
    assert_template 'edit'
  end

  def test_update_valid
    Thought.any_instance.stubs(:valid?).returns(true)
    put :update, id: Thought.first
    assert_redirected_to root_url
  end

  def test_destroy
    thought = Thought.first
    delete :destroy, id: thought
    assert_redirected_to root_url
    assert !Thought.exists?(thought.id)
  end
end
