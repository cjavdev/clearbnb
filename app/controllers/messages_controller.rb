class MessagesController < ApplicationController
  def index
    @reservation = current_user.all_reservations.find(params[:reservation_id])
    @messages = @reservation.messages
  end

  def create
    @reservation = current_user.all_reservations.find(message_params[:reservation_id])
    @message = current_user.sent_messages.new(message_params)
    @message.to_user = @reservation.guest == current_user ? @reservation.host : @reservation.guest
    if !@message.save
      flash[:errors] = @message.errors.full_messages
    end
    redirect_to messages_path(reservation_id: @reservation.id)
  end

  private

  def message_params
    params.require(:message).permit(:content, :reservation_id)
  end
end
