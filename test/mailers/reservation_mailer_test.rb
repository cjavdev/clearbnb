require "test_helper"

class ReservationMailerTest < ActionMailer::TestCase
  test "host_booked" do
    mail = ReservationMailer.host_booked
    assert_equal "Host booked", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "guest_booked" do
    mail = ReservationMailer.guest_booked
    assert_equal "Guest booked", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
