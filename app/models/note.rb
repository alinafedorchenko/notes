class Note < ApplicationRecord

  validates :title, :content, presence: true

  update_index('notes') { self }

  def self.es_search(query)
    note_index = NotesIndex.query(
      bool: {
        should: [
          { term: { title: query } },
          { term: { content: query } }
        ]
      }
    )

    Note.where(id: note_index.pluck(:_id))
  end
end
