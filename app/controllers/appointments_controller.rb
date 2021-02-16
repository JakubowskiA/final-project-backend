class AppointmentsController < ApplicationController
  def show
    user_id = request.headers["User-Id"]
    date = request.headers["Appointment-Date"].to_date()
    user_appointments = Appointment.date(date).select do |appointment|
      appointment.user_id == params[:user_id].to_i
    end
    render json: user_appointments
  end

  def create
    new_appointment = Appointment.create(appointment_params)
    render json: new_appointment
  end

  def destroy
    appointment_id = request.headers["Appointment-Id"].to_i
    appointment = Appointment.find_by(id: appointment_id)
    appointment.destroy
    render json: {}
  end

  private

  def appointment_params
    params.require(:appointment).permit(:name, :date, :user_id)
  end
end
