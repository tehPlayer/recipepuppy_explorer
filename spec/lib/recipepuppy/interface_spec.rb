require 'rails_helper'

describe Recipepuppy::Interface do
  shared_examples 'results returned' do
    it 'returns aggregator' do
      VCR.use_cassette(cassette) do
        expect(subject).to be_an_instance_of(Recipepuppy::ResultsAggregator)
      end
    end

    it 'returns populated results' do
      VCR.use_cassette(cassette) do
        expect(subject.entries).not_to be_empty
      end
    end
  end

  describe '#search' do
    subject { described_class.search(params) }

    context 'with empty search' do
      let(:params) {{search: ''}}
      let(:cassette) { 'empty_search' }

      it_behaves_like 'results returned'
    end

    context 'with populated search' do
      let(:params) {{search: 'pancakes'}}
      let(:cassette) { 'populated_search' }

      it_behaves_like 'results returned'
    end

    context 'with pages' do
      let(:params) {{search: 'pancakes', page: 3}}
      let(:cassette) { 'paginated_populated_search' }

      it_behaves_like 'results returned'
    end
  end
end
