require 'spec_helper'

class Profitwell::Client
  describe Transaction do

    before(:each) do
      @client = Profitwell::Client.new(ENV['API_TOKEN'])
    end

    describe "#transactions" do
      it "returns all manual transactions from account as Array" do
        VCR.use_cassette 'transactions/transactions' do
        expect(@client.transactions).to be_an_instance_of(Array)
        end
      end

      it "returns each user transaction as a Hash" do
        VCR.use_cassette 'transactions/transactions' do
          expect(@client.transactions[0]).to be_an_instance_of(Hash)
        end
      end
    end

    # describe "#new_customer" do
    #   email = "test@hookengine.com"
    #   plan_name = "New API Test Subscription"
    #   plan_interval = "Month"
    #   plan_value = 10
    #   start_date = "2016-06-11T00:00:00Z"
    #   end_date = "2017-26-12:00:00Z"
    #   currency = "usd"
    #   it "creates a new customer and subscription and returns customer info" do
    #     VCR.use_cassette 'transactions/new_customer' do
    #       expect(@client.new_customer(email, plan_name, plan_interval, plan_value, start_date, end_date: end_date, currency: currency)).to be_an_instance_of(Hash)
    #     end
    #   end
    # end

  end
end
