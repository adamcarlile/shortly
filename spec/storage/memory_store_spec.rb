require 'rails_helper'

RSpec.describe MemoryStore do
  let(:identifier) { '1234' }
  let(:object) { OpenStruct.new(id: identifier) }

  subject { MemoryStore.new }

  describe 'Persistance' do
    before { subject.save(object) }

    it 'should be findable' do
      expect(subject.find(identifier)).to eql(object)
    end
  end

  describe 'ID assignment' do
    let(:identifier) { nil }
    before { subject.save(object) }
    
    it 'should assign an ID' do
      expect(subject.find(object.id)).to eql(object)
    end
  end
end