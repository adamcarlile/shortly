require 'rails_helper'

RSpec.describe Short, type: :model do
  let(:url)   { Faker::Internet.url }
  let(:short) { Short.new(url: url) }

  describe 'Object' do
    subject { short }

    it { expect(subject.url.to_s).to eql(url) }
    it { expect(subject.url).to be_instance_of(URL) }
    it { expect(subject.key).to be_present }
  end

  describe 'Persistance' do
    before { short.save! }

    it 'should be findable' do
      expect(Short.find(short.key)).to eql(short)
    end

  end

end