require 'rails_helper'

describe Notes::JsonLoader do
  let(:file_path) { 'spec/fixtures/sample_notes.json' }

  describe '#load' do
    context 'file exists and is valid JSON' do
      it 'loads data from the JSON' do
        loader = Notes::JsonLoader.new(file_path: file_path)
        expect(loader.load).to be_an(Array)
      end
    end
  end
end
