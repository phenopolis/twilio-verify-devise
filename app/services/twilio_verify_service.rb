class TwilioVerifyService
  attr_reader :twilio_client, :twilio_account_sid, :twilio_auth_token, :twilio_verify_service_sid

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
    @twilio_account_sid = Rails.application.credentials[:twilio_account_sid] || ENV['TWILIO_ACCOUNT_SID']
    @twilio_auth_token = Rails.application.credentials[:twilio_auth_token] || ENV['TWILIO_AUTH_TOKEN']
    @twilio_verify_service_sid = Rails.application.credentials[:twilio_verify_service_sid] || ENV['TWILIO_VERIFY_SERVICE_SID']

    raise 'Missing Twilio credentials' unless @twilio_account_sid && @twilio_auth_token && @twilio_verify_service_sid

    @twilio_client = Twilio::REST::Client.new(@twilio_account_sid, @twilio_auth_token)
  end

  def twilio_verify_service
    twilio_client.verify.services(twilio_verify_service_sid)
  end

  def e164_format(phone_number)
    self.class.e164_format(phone_number)
  end
end
