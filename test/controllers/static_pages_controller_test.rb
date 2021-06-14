require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end

  test "should get team" do
    get static_pages_team_url
    assert_response :success
  end

  test "should get privacy_policy" do
    get static_pages_privacy_policy_url
    assert_response :success
  end

  test "should get cgv" do
    get static_pages_cgv_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

end
