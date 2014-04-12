require 'spec_helper'

describe User do

  describe 'validation' do
    it 'has a matching password confirmation for the password' do
      user = User.new
      user.password = 'password'
      user.password_confirmation = 'anotherpassword'

      expect(user).to_not be_valid
      expect(user.errors[:password_confirmation]).to_not be_blank
    end

    it { should have_many :lists }
  end

end
