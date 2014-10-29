require 'rails_helper'

RSpec.describe Project, :type => :model do
  it 'should be valid' do
    expect( create(:project) ).to be_valid
  end
end
