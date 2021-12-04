class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    event = Event.create!(
      request_body: request.raw_post,
      source: params[:source],
    )
    EventJob.perform_later(event)
    render json: { message: "success" }
  end
end
