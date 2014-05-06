require 'spec_helper'

describe Project do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:motto) }
  it { should validate_presence_of(:thumbnail) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:priority) }
  it { should validate_presence_of(:content) }

  context 'when there is a record in the other locale' do
    before :each do
      create :project, locale: I18n.alternative_locale
    end

    it { should validate_uniqueness_of(:address).scoped_to(:locale) }
  end

  it 'should automatically fill in the locale field' do
    one = create :project, locale: nil
    expect(one.locale.to_s).to eq(I18n.locale.to_s)
  end
end
