# To deliver this notification:
#
# NewMessage.with(message: @message).deliver_later(current_user)
# NewMessage.with(message: @message).deliver(current_user)

class NewMessage < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :email, mailer: "MessageMailer", method: :new_message
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :message

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
