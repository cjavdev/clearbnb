class Message < ApplicationRecord
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'
  belongs_to :reservation, optional: true
  has_noticed_notifications

  after_create_commit :notify_to_user

  def self.mark_as_read!
    all.map(&:notifications_as_message).flatten.each(&:mark_as_read!)
  end

  def notify_to_user
    NewMessage.with(message: self).deliver_later(to_user)
  end
end
