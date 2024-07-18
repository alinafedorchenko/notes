require 'rails_helper'

describe NotesController, type: :controller do
  let!(:note) { create(:note, title: "First note", content: "This is a test note.") }
  let!(:note_2) { create(:note, title: "Second note", content: "This is a test note2.") }

  describe "GET #index" do
    let(:expected_response) do
      [
        {
          title: "First note",
          content: "This is a test note."
        },
        {
          title: "Second note",
          content: "This is a test note2."
        }
      ]
    end

    it "returns a success response" do
      Note.reindex

      get :index, params: { query: "First" }

      expect(JSON.parse(response.body, symbolize_names: true)).to match([
        {
          title: "First note",
          content: "This is a test note."
        }
      ])
    end

    it "returns a success response" do
      get :index
      expect(response).to be_successful
      expect(JSON.parse(response.body, symbolize_names: true)).to match(expected_response)
    end
  end

  describe "GET #show" do
    let(:expected_response) do
      {
        title: "First note",
        content: "This is a test note."
      }
    end

    it "returns a success response" do
      get :show, params: { id: note.id }
      expect(response).to be_successful
      expect(JSON.parse(response.body, symbolize_names: true)).to match(expected_response)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:expected_response) do
        {
          title: "First note",
          content: "This is a test note."
        }
      end

      let(:valid_attributes) {
        { title: "First note", content: "This is a test note." }
      }

      it "creates a new note" do
        expect {
          post :create, params: { note: valid_attributes }
        }.to change(Note, :count).by(1)
      end

      it "renders a JSON response with the new note" do
        post :create, params: { note: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body, symbolize_names: true)).to match(expected_response)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) {
        { title: "", content: "This is a test note." }
      }

      it "does not create a new note" do
        expect {
          post :create, params: { note: invalid_attributes }
        }.to change(Note, :count).by(0)
      end

      it "renders a JSON response with errors for the new note" do
        post :create, params: { note: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the note' do
      expect { delete :destroy, params: { id: note.id } }.
        to change(Note, :count).by(-1)
    end

    it 'returns a 204 (no content)' do
      delete :destroy, params: { id: note.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
