require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  
  test 'Projects list on Project#index page' do
    FactoryGirl.create(:project)
    
    visit(projects_path)
    assert page.has_content?('The new shoe project')
  end

end