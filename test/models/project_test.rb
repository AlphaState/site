require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  test 'should not create a new record with blank fields' do
    assert_not Project.new.save
  end

  test 'should find the previous and next records' do
    time = Time.now

    first = create :project, priority: 3
    second = create :project, priority: 2
    third = create :project, priority: 1

    assert_equal second.find_previous, first
    assert_equal second.find_next, third
  end
end
