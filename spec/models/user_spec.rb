require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:each) do
    @user ||= create(:user, name: 'George R. R. Martin')
  end

  describe 'a valid user' do
    it 'has a secure password' do
      expect(@user).to respond_to(:authenticate)
    end

    it 'is not an admin' do
      expect(@user.admin).not_to be_truthy
    end

    it 'has a #firstname' do
      expect(@user.firstname).to eq 'George'
    end

    it 'has a #lastname' do
      expect(@user.lastname).to eq 'Martin'
    end

    context 'with a middle name' do
      it 'has a valid #middlename' do
        expect(@user.middlename).to eq 'R. R.'
        @user.name = 'Test My User'
        expect(@user.middlename).to eq 'My'
      end
    end

    context 'without a middle name' do
      it 'has an empty #middlename' do
        @user.name = 'Test User'
        expect(@user.middlename).to be_empty
      end
    end

  end
end
