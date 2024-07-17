class NotesController < ApplicationController

  before_action :set_note, only: [:show, :update, :destroy]

  def index
    if params[:query].present?
      @notes = Note.search(params[:query])
    else
      @notes = Note.all
    end

    render json: @notes
  end

  def show
    render json: @note
  end

  def create
    result = Note::Create.new(note_params:).call

    if result.success?
      render_success(result.note)
    else
      render_unprocessable(result.errors.first)
    end
  end

  def update
    result = Note::Update.new(note: @note, note_params:).call

    if result.success?
      render_success(result.note)
    else
      render_unprocessable(result.errors.first)
    end
  end

  def destroy
    @note.destroy!
    head :no_content
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
