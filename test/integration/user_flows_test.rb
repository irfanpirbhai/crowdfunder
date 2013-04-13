require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  test "User can sign up" do
    visit '/signup'
    fill_in('First name', :with => 'John')
    fill_in('Last name', :with => 'Smith')
    fill_in('Email', :with => 'john@example.com')
    fill_in('Password', :with => '1234')
    fill_in('Password confirmation', :with => '1234')
    click_button('Create User')
    assert page.has_selector?(".alert-success", text: "Signed up")
  end

end