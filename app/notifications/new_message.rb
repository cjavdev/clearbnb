# To deliver this notification:
#
# NewMessage.with(message: @message).deliver_later(current_user)
# NewMessage.with(message: @message).deliver(current_user)

class NewMessage < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :email, mailer: "MessageMailer", method: :new_message
  deliver_by :twilio, format: :format_for_twilio

  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :message

  def format_for_twilio
    {
      Body: params[:message].content,
      From: Rails.application.credentials.twilio[:phone_number],
      To: recipient.phone_number
    }
  end

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end
end
