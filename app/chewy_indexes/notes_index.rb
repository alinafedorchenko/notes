class NotesIndex < Chewy::Index
  settings analysis: {
    filter: {
      autocomplete_filter: {
        type: 'edge_ngram',
        min_gram: 1,
        max_gram: 20
      }
    },
    analyzer: {
      autocomplete: {
        type: 'custom',
        tokenizer: 'standard',
        filter: ['lowercase', 'autocomplete_filter']
      },
      keyword: {
        tokenizer: 'keyword',
        filter: ['lowercase']
      }
    }
  }

  index_scope ::Note

  field :title, analyzer: 'autocomplete', type: 'text'
  field :content, analyzer: 'autocomplete', type: 'text'
end