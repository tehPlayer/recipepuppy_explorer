require 'rails_helper'

describe MainController, type: :controller do
  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#search' do
    let(:params) { {search: ''} }

    it 'responds successfully' do
      VCR.use_cassette('empty_search') do
        post :search, params: params
        expect(response).to be_success
      end
    end

    it 'returns correct format' do
      VCR.use_cassette('empty_search') do
        post :search, params: params
        expect(response_json.keys).to contain_exactly(
          :entries, :page, :total_results, :success)
      end
    end
  end
end
