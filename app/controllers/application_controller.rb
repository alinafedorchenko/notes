class ApplicationController < ActionController::API

  private

  def render_success(record)
    render(json: record)
  end

  def render_unprocessable(e)
    errors = e.respond_to?(:messages) ? e.messages : e
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
