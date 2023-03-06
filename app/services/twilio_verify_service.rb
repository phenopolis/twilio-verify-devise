class TwilioVerifyService
  attr_reader :twilio_client

  def self.send_sms_token(phone_number)
    new.twilio_verify_service.verifications.create(to: e164_format(phone_number), channel: 'sms')
  end

  def self.verify_sms_token(phone_number, token)
    new.twilio_verify_service.verification_checks.create(to: e164_format(phone_number), code: token)

  end

  def self.e164_format(phone_number)
    "+1#{phone_number.gsub(/[^0-9a-z\\s]/i, '')}"
  end

  def initialize
    @twilio_client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def twilio_verify_service
    twilio_client.verify.services(ENV['TWILIO_VERIFY_SERVICE_SID'])
  end

  def e164_format(phone_number)
    self.class.e164_format(phone_number)
  end
end
