require 'rails_helper'

describe NodeDataConsumer do
    it 'process message' do
        message = JSON.generate({ "value": {"node_id": "18446744073709551615", "value": 1, "timestamp": "2020-01-03T01:19:13 -00:00"}})
        new_message = double("new_message", new: {"node_id"=>"18446744073709551615", "timestamp"=>"2020-01-03T01:19:13 -00:00", "value"=>1})
        stream = double("stream", checkpoint: new_message.new)
        consumer = NodeDataConsumer.new(stream)
        
        expect(consumer.process(message, new_message)).to eq "node_id"=>"18446744073709551615", "timestamp"=>"2020-01-03T01:19:13 -00:00", "value"=>1
    end
end
