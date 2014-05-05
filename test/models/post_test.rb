require 'test_helper'

class PostTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  test 'should not create a post with blank fields' do
    one = Post.new
    assert_not one.save
  end

  test 'should not create a post with a duplicate address' do
    one = create :post
    another = build :post
    another.address = one.address
    assert_not another.save
  end

  test 'should automatically fill in the locale field' do
    one = build :post
    one.locale = nil
    assert one.save
    assert_equal one.locale.to_s, I18n.locale.to_s
  end

  test 'should automatically fill in the date field' do
    one = build :post
    one.date = nil
    assert one.save
    assert_not_nil one.date
  end

  test 'should find the previous record' do
    time = Time.now

    past = build :post
    past.date = time - 1.day
    assert past.save

    current = build :post
    current.date = time
    assert current.save

    future = build :post
    future.date = time + 1.day
    assert future.save

    assert_equal current.find_previous, future
    assert_equal current.find_next, past
  end
end
