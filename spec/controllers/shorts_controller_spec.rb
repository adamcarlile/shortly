require 'rails_helper'

RSpec.describe ShortsController, type: :controller do

  describe '#create' do
    let(:url)    { Faker::Internet.url }
    let(:params) { {format: format, short: { url: url } } }

    before { post :create, params: params } 
    describe 'json' do
      let(:format) { :json }
      it { expect(JSON.parse(response.body)['url']).to eql(url) }
    end
  end

  describe '#show' do
    let(:url)   { Faker::Internet.url }
    let(:short) { Short.new(url: url) }
    before do 
      short.save
      get :show, params: { id: short.id }
    end

    it { expect(response.location).to eql(url) }
    it { expect(response.code).to eql('301') }

  end

end
