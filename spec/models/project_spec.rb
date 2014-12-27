require 'rails_helper'

describe Project do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:motto) }
  it { should validate_presence_of(:thumbnail) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:priority) }
  it { should validate_presence_of(:content) }

  context 'when there is a record in the other locale' do
    it 'should validate the uniqueness of `address` scoped to `locale`' do
      stranger = create(:project, locale: I18n.alternative_locale)

      one = build(:project, address: stranger.address)
      two = build(:project, address: stranger.address)

      expect(one.save).to be true
      expect(two).not_to be_valid
    end
  end

  it 'should automatically fill in the locale field' do
    one = create(:project, locale: nil)
    expect(one.locale.to_s).to eq(I18n.locale.to_s)
  end
end
