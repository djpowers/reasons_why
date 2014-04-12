require 'spec_helper'

describe List do

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :subject_a }
    it { should validate_presence_of :subject_b }
    it { should validate_presence_of :adjective }
    it { should validate_presence_of :user }

    it { should belong_to :user }
    it { should have_many(:reasons).dependent(:destroy) }
  end

end
