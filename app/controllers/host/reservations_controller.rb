class Host::ReservationsController < ApplicationController
  def show
    @reservation = current_user.host_reservations.find(params[:id])
  end
end
