# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/host_booked
  def host_booked
    ReservationMailer.host_booked
  end

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/guest_booked
  def guest_booked
    ReservationMailer.guest_booked
  end

end
