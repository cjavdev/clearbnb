# To deliver this notification:
#
# HostReservationBookedNotification.with(reservation: @reservation).deliver_later(current_user)
# HostReservationBookedNotification.with(reservation: @reservation).deliver(current_user)

class HostReservationBookedNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :email, mailer: "ReservationMailer", method: :host_booked
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :reservation

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
