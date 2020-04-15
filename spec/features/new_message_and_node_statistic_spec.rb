require 'rails_helper'

require './app/consumers/node_data_consumer.rb'
Dir["./lib/*.rb"].each {|file| require file }
require './app/models/node.rb'
require './app/models/statistic.rb'

describe 'Data Stream Feature tests' do
    it 'processes messages from same node within same minute' do
        message1 = JSON.generate({ "value": {"node_id": "9223372036854775807", "value": 1, "timestamp": "2020-01-03T01:19:13 -01:00"}})
        message2 = JSON.generate({ "value": {"node_id": "9223372036854775807", "value": 5, "timestamp": "2020-01-03T01:19:13 -01:00"}})
        consumer = NodeDataConsumer.new
        result1 = consumer.process(message1)
        result2 = consumer.process(message2)
        expect(consumer.process(message2)).to be_a(Statistic)
    end

    it 'processes messages from 2 different nodes within same minute' do
        message1 = JSON.generate({ "value": {"node_id": "9223372036854775807", "value": 3, "timestamp": "2020-01-03T01:19:13 -01:00"}})
        message3 = JSON.generate({ "value": {"node_id": "9223372036854775806", "value": 3, "timestamp": "2020-01-03T01:19:13 -01:00"}})
        consumer = NodeDataConsumer.new
        consumer.process(message1)
        expect(consumer.process(message3)).to be_a(Statistic)
    end

    it 'proocesses messages from same node at different minutes' do
        message1 = JSON.generate({ "value": {"node_id": "9223372036854775805", "value": 1, "timestamp": "2020-01-03T01:19:13 -00:00"}})
        message2 = JSON.generate({ "value": {"node_id": "9223372036854775805", "value": 5, "timestamp": "2020-01-03T01:19:13 -01:00"}})
        consumer = NodeDataConsumer.new
        consumer.process(message1)
        expect(consumer.process(message2)).to be_a(Statistic)
    end
end
