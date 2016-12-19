require 'spec_helper'

class Profitwell::Client
  describe TransactionDetail do

    before(:each) do
      @client = Profitwell::Client.new(ENV['API_TOKEN'])
    end

    describe "#transaction_detail" do

      it "returns all transactions for a given user" do
        VCR.use_cassette 'transaction_detail/transaction_detail' do
        expect(@client.transaction_detail("pwu_BcM4gsNy6M2g")).to be_an_instance_of(Array)
        end
      end

      it "returns each transactions as a Hash" do
        VCR.use_cassette 'transaction_detail/transaction_detail' do
        expect(@client.transaction_detail("pwu_BcM4gsNy6M2g")[0]).to be_an_instance_of(Hash)
        end
      end

    end

    # describe "#update_subscription" do
    #   it "returns an updated transaction detail as an Array" do
    #     VCR.use_cassette 'transaction_detail/update_subscription' do
    #       expect(@client.update_subscription("pwu_BcM4gsNy6M2g", "NewHookAPITestPlan", "Month", 5, "2017-04-11T00:00:00Z")).to be_an_instance_of(Array)
    #     end
    #   end
    # end

    describe "delete_user" do
      it "returns a confirmation that the user has been deleted" do
        VCR.use_cassette 'transaction_detail/delete_user_subscription' do
          expect(@client.delete_user("pwu_BcM4gsNy6M2g")).to eq({
            "detail" => "This user's data has been deleted."
          })
        end
      end
    end

  end
end
