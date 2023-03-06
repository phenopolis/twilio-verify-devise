# frozen_string_literal: true

RSpec.describe "routes with devise_twilio_verify", type: :controller do
  describe "with default devise_for" do
    it "route to devise_twilio_verify#GET_verify_twilio_verify" do
      expect(get: '/users/verify_twilio_verify').to route_to("devise/devise_twilio_verify#GET_verify_twilio_verify")
    end

    it "routes to devise_twilio_verify#POST_verify_twilio_verify" do
      expect(post: '/users/verify_twilio_verify').to route_to("devise/devise_twilio_verify#POST_verify_twilio_verify")
    end

    it "routes to devise_twilio_verify#GET_enable_twilio_verify" do
      expect(get: '/users/enable_twilio_verify').to route_to("devise/devise_twilio_verify#GET_enable_twilio_verify")
    end

    it "routes to devise_twilio_verify#POST_enable_twilio_verify" do
      expect(post: '/users/enable_twilio_verify').to route_to("devise/devise_twilio_verify#POST_enable_twilio_verify")
    end

    it "routes to devise_twilio_verify#POST_disable_twilio_verify" do
      expect(post: '/users/disable_twilio_verify').to route_to("devise/devise_twilio_verify#POST_disable_twilio_verify")
    end

    it "route to devise_twilio_verify#GET_verify_twilio_verify_installation" do
      expect(get: '/users/verify_twilio_verify_installation').to route_to("devise/devise_twilio_verify#GET_verify_twilio_verify_installation")
    end

    it "routes to devise_twilio_verify#POST_verify_twilio_verify_installation" do
      expect(post: '/users/verify_twilio_verify_installation').to route_to("devise/devise_twilio_verify#POST_verify_twilio_verify_installation")
    end

    it "routes to devise_twilio_verify#request_sms" do
      expect(post: '/users/request-sms').to route_to("devise/devise_twilio_verify#request_sms")
    end
  end

  describe "with customised mapping" do
    # See routing in spec/internal/config/routes.rb for the mapping
    it "updates to new routes set in the mapping" do
      expect(get: '/lockable_users/verify-token').to route_to("devise/devise_twilio_verify#GET_verify_twilio_verify")
      expect(post: '/lockable_users/verify-token').to route_to("devise/devise_twilio_verify#POST_verify_twilio_verify")
      expect(get: '/lockable_users/enable-two-factor').to route_to("devise/devise_twilio_verify#GET_enable_twilio_verify")
      expect(post: '/lockable_users/enable-two-factor').to route_to("devise/devise_twilio_verify#POST_enable_twilio_verify")
      expect(get: '/lockable_users/verify-installation').to route_to("devise/devise_twilio_verify#GET_verify_twilio_verify_installation")
      expect(post: '/lockable_users/verify-installation').to route_to("devise/devise_twilio_verify#POST_verify_twilio_verify_installation")
    end

    it "doesn't change routes not in custom mapping" do
      expect(post: '/lockable_users/disable_twilio_verify').to route_to("devise/devise_twilio_verify#POST_disable_twilio_verify")
      expect(post: '/lockable_users/request-sms').to route_to("devise/devise_twilio_verify#request_sms")
    end
  end
end
