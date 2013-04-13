require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Project has a user association on create" do

    project = FactoryGirl.create(:project)
    assert_equal "John", project.user.first_name

  end

end
