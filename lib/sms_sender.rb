require 'twilio-ruby'

class SmsSender
  def batch_notify(participants)
    participants.each do |participant|
      send_text(participant)
    end
  end

  def send_text(participant)
    account_sid = 'AC4aa74a6d9d68705f2a82a632191380cd'
    auth_token = '313804e81ab28a2143ab15f6def675b5'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: '+441788 422641',
      to: participant.phone,#changed number to phone
      body: "Hey #{participant.name}, you have been chosen to buy a gift for #{participant.receiver}!"
    )
  end
end
