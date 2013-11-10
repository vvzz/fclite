class AppointmentsController < ApplicationController
  require 'active_support/core_ext/date_time/calculations'
  require 'rest_client'

  def create
      jsonObj = params[:appointment]

      @appt = Appointment.new(
          :post_id => jsonObj['post_id'],
          :email => jsonObj['email'],
          :start => jsonObj['start']
      )

      respond_to do |format|
        if verify_recaptcha(:model => @appt ) && @appt.save
          # RestClient.post "https://api:key-8aii7gpb7a60ry-i751lo8jn83h5xpd9@api.mailgun.net/v2/fatcatrent.mailgun.org/messages",
                          # :from => "<noreply@fatcatrent.mailgun.org>",
                          # :to => @appt.email,
                          # :subject => "Appointment confirmation",
                          # :text => "Please confirm your scheduled property visit on " +
                              # @appt.start.to_formatted_s(:long) +
                              # "link: " + "http://#{request.host}:#{request.port}/renters/timeslots/#{@appt.id}/confirm/#{@appt.code}"

          format.json { render json: @appt, status: :created }
        else
          format.json { render json: @appt.errors, status: :unprocessable_entity }
        end
      end

  end
end
