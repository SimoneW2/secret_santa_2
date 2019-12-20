require 'twilio-ruby'

class SmsSender
  def batch_notify(participants)
    participants.each do |participant|
      send_text(participant)
    end
  end

  def send_text(participant)
    account_sid = 'AC8563169d342251fc790de6331d67e409'
    auth_token = '5a6502abc00a66421303c76cdc4979b5'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: '+441788 422641',
      to: participant.phone,#changed number to phone
      body: "Hey #{participant.name}, you have been chosen to buy a gift for #{participant.receiver}!"
    )
  end
end
