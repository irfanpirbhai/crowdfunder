require 'test_helper'

class PledgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Pledge requires user association on create" do
    pledge = FactoryGirl.build(:pledge, :user => nil)
    assert_false pledge.save
    assert_equal "can't be blank", pledge.errors[:user].first
  end

  test "Pledge requires project association on create" do
    pledge = FactoryGirl.build(:pledge, :project => nil)
    assert_false pledge.save
    assert_equal "can't be blank", pledge.errors[:project].first
  end

  test "Pledge requires an amount" do
    pledge = FactoryGirl.build(:pledge, :amount => nil)
    assert_false pledge.save
    assert_equal "can't be blank", pledge.errors[:amount].first
  end

  test "Pledge requires positive number" do
    pledge = FactoryGirl.build(:pledge, :amount => -4)
    assert_false pledge.save
    assert_equal "must be greater than 0", pledge.errors[:amount].first
  end

  test "Pledge cannot be a non-number" do
    pledge = FactoryGirl.build(:pledge, :amount => "string")
    assert_false pledge.save
    assert_equal "is not a number", pledge.errors[:amount].first
  end

end


# pledge = FactoryGirl.build(:pledge, user: nil)

#     # Should not be able to save
#     assert_false pledge.save
#     assert_equal "can't be blank", pledge.errors[:user].first