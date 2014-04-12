require 'spec_helper'

describe Reason do

  describe 'validations' do
    it { should validate_presence_of :body }

    it { should belong_to :list }
  end

end
