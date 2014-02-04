require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { bio: @company.bio, blog_feed: @company.blog_feed, email: @company.email, linkedin: @company.linkedin, name: @company.name, title: @company.title, twitter: @company.twitter, website: @company.website, weibo: @company.weibo }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    put :update, id: @company, company: { bio: @company.bio, blog_feed: @company.blog_feed, email: @company.email, linkedin: @company.linkedin, name: @company.name, title: @company.title, twitter: @company.twitter, website: @company.website, weibo: @company.weibo }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
