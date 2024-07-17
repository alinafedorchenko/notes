class Note::Update

  include Interactor

  expose :note

  def initialize(note:, note_params:)
    @note = note
    @note_params = note_params
  end

  def call
    @note.assign_attributes(@note_params)

    validate(@note)

    @note.save!
  end

end
