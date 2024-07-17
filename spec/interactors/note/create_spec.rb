require 'rails_helper'

describe Note::Create do
  let(:note_params) do
    {
      title: 'Title 1',
      content: 'Content 1'
    }
  end

  let(:result) do
    described_class.new(
      note_params:,
    ).call
  end

  context 'when valid params is provided' do
    it 'creates a note' do
      expect(result.success?).to be true

      expect(result.note.title).to eq('Title 1')
      expect(result.note.content).to eq('Content 1')
    end
  end

  context 'when invalid params is provided' do
    let(:note_params) do
      {
        title: 'Title 1'
      }
    end

    it 'fails' do
      expect(result.success?).to be false

      expect(result.errors.first).to be_present
    end
  end
end
