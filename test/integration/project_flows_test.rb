require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  
  test 'Projects list on Project#index page' do
    FactoryGirl.create(:project, :title => "Project 1")
    FactoryGirl.create(:project, :title => "Project 2")
    FactoryGirl.create(:project, :title => "Project 3")

    visit('/projects')
    assert projects_path, current_path

    # expect the header
    assert page.has_content?("Project Listings")

    # expect the projects to list
    assert page.has_content?('Project 1')
    assert page.has_content?('Project 2')
    assert page.has_content?('Project 3')
  end

end