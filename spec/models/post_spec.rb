require 'rails_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:content) }

  context 'when there is a record in the other locale' do
    it 'should validate the uniqueness of "address" scoped to "locale"' do
      stranger = create(:post, locale: I18n.alternative_locale)

      one = build(:post, address: stranger.address)
      two = build(:post, address: stranger.address)

      expect(one.save).to be true
      expect(two).not_to be_valid
    end
  end

  it 'should automatically fill in the locale field' do
    one = create(:post, locale: nil)
    expect(one.locale.to_s).to eq(I18n.locale.to_s)
  end

  it 'should automatically fill in the date field' do
    one = create(:post, date: nil)
    expect(one.date).not_to be_blank
  end
end
