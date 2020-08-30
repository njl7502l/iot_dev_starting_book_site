require 'json'
require 'faraday'

def lambda_handler(event:, context:)
  client = Faraday.new
  client.post do |req|
		req.url '<WEBHOOK URL>'
    req.headers['Content-Type'] = 'application/json'
    req.body = { text: "温度が#{30}度を超えています(現在の温度: #{event['value']}度)"}.to_json
  end
end
