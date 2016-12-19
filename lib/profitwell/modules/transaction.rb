class Profitwell::Client
  module Transaction

    def transactions
      transactions = connection.get('transactions/')
      parse_response(transactions)
    end

    def new_customer(email, plan_name, plan_interval, plan_value, start_date, options={})
      customer = connection.post('transactions/') do |req|
        req.params['email'] = email
        req.params['plan_name'] = plan_name
        req.params['plan_interval'] = plan_interval
        req.params['plan_value'] = plan_value
        req.params['start_date'] = start_date
        req.params['currency'] = options['currency'] unless options['currency'].nil?
        req.params['end_date'] = options['end_date'] unless options['end_date'].nil?
      end
      parse_response(customer)
    end
  end
end
