# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe "with a user with a mobile phone" do
    let!(:user) { create(:twilio_verify_user) }

    describe "User#find_by_mobile_phone" do
      it "should find the user" do
        expect(User.first).not_to be nil
        expect(User.find_by_mobile_phone(user.mobile_phone)).to eq(user)
      end

      it "shouldn't find the user with the wrong id" do
        expect(User.find_by_mobile_phone('21')).to be nil
      end
    end

    describe "user#with_twilio_verify_authentication?" do
      it "should be false when twilio verify isn't enabled" do
        user.twilio_verify_enabled = false
        request = double("request")
        expect(user.with_twilio_verify_authentication?(request)).to be false
      end
      it "should be true when twilio verify is enabled" do
        user.twilio_verify_enabled = true
        request = double("request")
        expect(user.with_twilio_verify_authentication?(request)).to be true
      end
    end

  end

  describe "with a user without a mobile phone" do
    let!(:user) { create(:user) }

    describe "user#with_twilio_verify_authentication?" do
      it "should be false regardless of twilio_verify_enabled field" do
        request = double("request")
        expect(user.with_twilio_verify_authentication?(request)).to be false
        user.twilio_verify_enabled = true
        expect(user.with_twilio_verify_authentication?(request)).to be false
      end
    end
  end
end
