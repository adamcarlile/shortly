require 'rails_helper'

RSpec.describe URL, type: :model do
  describe 'Coercion' do
    subject   { URL.new(url) }

    describe 'from string' do
      let(:url) { Faker::Internet.url }

      it { expect(subject.__getobj__).to be_kind_of(URI) }
    end

    describe 'from URI' do
      let(:url) { URI.parse(Faker::Internet.url) }

      it { expect(subject.__getobj__).to be_kind_of(URI) }
    end

  end

  describe 'scheme addition' do
    let(:url) { 'example.com/test-url' }
    subject   { URL.new(url) }
  
    it { expect(subject.to_s).to include('http://') }
  end
end