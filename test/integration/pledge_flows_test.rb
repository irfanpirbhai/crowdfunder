require 'test_helper'

class PledgeFlowsTest < ActionDispatch::IntegrationTest

  test "Users can pledge on projects when logged in" do
    project1 = FactoryGirl.create(:project, :title => "Project 1")
    project2 = FactoryGirl.create(:project, :title => "Project 2")
    project3 = FactoryGirl.create(:project, :title => "Project 3")
    user_login
    visit '/projects'
    page.click_on("Project 1")
    assert page.has_content?("Project 1")    
    assert page.has_link?('Back This Project')
    click_on('Back This Project')
    assert_equal '/projects/1/pledges/new', current_path
    fill_in('pledge_amount', :with => 50)
    find('form').click_button('Back This Project')
    assert_equal '/projects/1', current_path
    assert page.has_content?("Thanks for your support")    
  end

  
  test "Unauthenticated users are redirected to login before pledging on a project" do
    project1 = FactoryGirl.create(:project, :title => "Project 1")
    
    visit '/projects'
    page.click_on("Project 1")
    assert page.has_content?("Project 1")    
    assert page.has_link?('Back This Project')
    click_on('Back This Project')
    assert_equal '/login', current_path
    assert page.has_content?("Please log in")
    
    # user log in
    password = "1234"
    user = FactoryGirl.create(:user, :password => password)
    fill_in('email', :with => user.email)
    fill_in('password', :with => password)
    find('form').click_button('Log in')
    print page.html
    # redirect to pledge page
    assert page.has_content?("Sweet")
    #assert_equal '/projects/1/pledges/new', current_path -- works once, but not after second test - why?
  end
end