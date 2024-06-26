# frozen_string_literal: true

RSpec.describe DeviseTwilioVerify::Views::Helpers, type: :helper do
  describe "request sms link" do
    it "produces an anchor to the request-sms endpoint" do
      link = helper.twilio_verify_request_sms_link
      expect(link).to match(%r|href="/users/request-sms"|)
      expect(link).to match(%r|data-method="post"|)
      expect(link).to match(%r|data-remote="true"|)
      expect(link).to match(%r|id="twilio-verify-request-sms-link"|)
      expect(link).to match(%r|>Request SMS<|)
    end
  end

  describe "with a user" do
    let(:user) { create(:user) }

    describe "verify_twilio_verify_form" do
      it "creates a verify form with the user id as a field" do
        assign(:resource, user)
        form = helper.verify_twilio_verify_form { "I'm in a form" }
        expect(form).to match(%r|action="/users/verify_twilio_verify"|)
        expect(form).to match(%|<input type="hidden" name="user_id" id="user_id" value="#{user.id}"|)
      end
    end

    describe "enable_twilio_verify_form" do
      it "creates a verify form with the user id as a field" do
        assign(:resource, user)
        form = helper.enable_twilio_verify_form { "I'm in a form" }
        expect(form).to match(%r|action="/users/enable_twilio_verify"|)
      end
    end

    describe "verify_twilio_verify_installation_form" do
      it "creates a verify form with the user id as a field" do
        assign(:resource, user)
        form = helper.verify_twilio_verify_installation_form { "I'm in a form" }
        expect(form).to match(%r|action="/users/verify_twilio_verify_installation"|)
      end
    end

  end
end
