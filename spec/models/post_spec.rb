require 'spec_helper'

describe Post do
  it 'should not create a new record with blank fields' do
    expect(Post.new.save).to be_false
  end

  it 'should automatically fill in the locale field' do
    one = build :post, locale: nil
    expect(one.save).to be_true
    expect(one.locale.to_s).to eq(I18n.locale.to_s)
  end

  it 'should automatically fill in the date field' do
    one = build :post, date: nil
    expect(one.save).to be_true
    expect(one.date.blank?).to be_false
  end

  it 'should not create a post with a duplicate address' do
    one = create :post
    another = build :post, address: one.address
    expect(another.save).to be_false
  end
end
