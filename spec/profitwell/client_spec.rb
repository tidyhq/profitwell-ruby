require 'spec_helper'

module Profitwell
  describe Client do

    before(:each) do
      @client = Profitwell::Client.new(ENV['API_TOKEN'])
    end

    describe "#initialize" do
      it "instantiates a client and assigns auth_token" do
        expect(@client.auth_token).to eq(ENV['API_TOKEN'])
      end
    end

    describe "#auth_token=" do
      it "sets a new auth_token" do
        @client.auth_token = "API Test Token"
        expect(@client.auth_token).to eq("API Test Token")
        expect(@connection).to eq(nil)
      end
    end

    describe "#reset_connection" do
      it "resets the connection" do
        @client.reset_connection
        expect(@connection).to eq(nil)
      end
    end
  end
end
