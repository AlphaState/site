require 'spec_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  context 'when there is a record' do
    before :each do
      create :user
    end

    it { should validate_uniqueness_of :email }
  end

  it { should have_secure_password }
end
