require File.dirname(__FILE__) + '/../test_helper'
require 'recipes_controller'

# Re-raise errors caught by the controller.
class RecipesController; def rescue_action(e) raise e end; end

class RecipesControllerTest < Test::Unit::TestCase
  fixtures :recipes

  def setup
    @controller = RecipesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = recipes(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:recipes)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:recipe)
    assert assigns(:recipe).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:recipe)
  end

  def test_create
    num_recipes = Recipe.count

    post :create, :recipe => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_recipes + 1, Recipe.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:recipe)
    assert assigns(:recipe).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Recipe.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Recipe.find(@first_id)
    }
  end
end
