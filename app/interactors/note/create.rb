class Note::Create

  include Interactor

  expose :note

  def initialize(note_params:)
    @note_params = note_params
  end

  def call
    @note = Note.new(@note_params)

    validate(@note)

    @note.save!
  end

end
