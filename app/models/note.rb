class Note < ApplicationRecord

  searchkick searchable: [:title, :content],
             callbacks: :async,
             match: :word_start

    def search_data
      {
        title: title,
        content: content
      }
    end

  validates :title, :content, presence: true
end
