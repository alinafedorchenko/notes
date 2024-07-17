module Interactor

  extend ActiveSupport::Concern

  included do
    include Hanami::Interactor

    def validate(model, context = nil)
      error!(model.errors) unless model.valid?(context)
    end
  end
end
