require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  
  test 'Projects list on Project#index page' do
    FactoryGirl.create(:project, :title => "Project 1")
    FactoryGirl.create(:project, :title => "Project 2")
    FactoryGirl.create(:project, :title => "Project 3")

    visit('/projects')
    assert_equal projects_path, current_path

    # expect the header
    assert page.has_content?("Projects Listing")

    # expect the projects to list
    assert page.has_content?('Project 1')
    assert page.has_content?('Project 2')
    assert page.has_content?('Project 3')
  end

  test 'Navigation' do
    FactoryGirl.create(:project, :title => "Project 1")

    # visit root path
    visit('/')
    assert_equal root_path, current_path

    # Home tab is highlighted in nav
    assert_equal "Home", find("div.navbar-inner ul.nav li.active").text
    
    # click on Projects tab in nav
    find("div.navbar-inner ul.nav").click_link("Projects")
    assert_equal projects_path, current_path

    # Projects tab is highlighted in nav
    assert_equal "Projects", find("div.navbar-inner ul.nav li.active").text

    # Only the Projects tab is highlighted in nav
    page.assert_selector "div.navbar-inner ul.nav li.active", :count => 1

    # Click link in project list
    page.click_on("Project 1")
    assert_equal "Projects", find("div.navbar-inner ul.nav li.active").text

    # The Projects tab is still highlighted in nav
    assert_equal "Projects", find("div.navbar-inner ul.nav li.active a").text
  end
  
  test 'Project show page' do
    FactoryGirl.create(:project, :title => "Project 1")
    visit('/projects')
    page.click_on("Project 1")
    assert page.has_content?("Project 1")
    assert page.has_content?("10000")
  end

end
