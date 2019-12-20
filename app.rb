require 'sinatra/base'
require './lib/sms_sender'
# require 'data_mapper'
require_relative './data_mapper_setup'

class SecretSanta < Sinatra::Base

  # get '/' do
  #   'Secret Santa!'
  # end

  get '/' do
    erb :form
  end

  post '/names' do

    participant_1 = Participant.new(name: params[:participant_1_name], email: params[:participant_1_email], phone: params[:participant_1_phone])# this creates an instance of the participant with the params name and email attached
    participant_2 = Participant.new(name: params[:participant_2_name], email: params[:participant_2_email], phone: params[:participant_2_phone])

     participant_1.save #This calls the save method from data mapper to the new object so that a new record is created in the relevant database table and it will populate itselft with  new data like ID.
     participant_2.save

     participants = Participant.all #This selects the whole table from the database
    receivers = participants.map(&:name) #Is this selecting just the names from the table?

    participants.each do |participant|
      if participant.name != receivers.last #
        participant.receiver = receivers.pop
        participant.save
      else
        participant.receiver = receivers.pop[0]
        participant.save
      end
    end

    # send text message here, immediately after the receiver has been set
    # participants.each do |participant|
    #   SmsSender.new.send_text(participant)
    # end

    SmsSender.new.batch_notify(participants)

    redirect '/confirmation'
  end

  get '/confirmation' do
    @participants = Participant.all
    erb :confirmation
  end

  run! if app_file == $0
end
