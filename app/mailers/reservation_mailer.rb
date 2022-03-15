class ReservationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.host_booked.subject
  #
  def host_booked
    @reservation = params[:reservation]

    mail to: @reservation.host.email, subject: "You have a new reservation!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.guest_booked.subject
  #
  def guest_booked
    @reservation = params[:reservation]

    mail to: @reservation.guest.email, subject: "Your reservation is confirmed!"
  end
end
