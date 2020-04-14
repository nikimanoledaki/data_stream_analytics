require './app/consumers/node_data_consumer.rb'
Dir["./lib/*.rb"].each {|file| require file }
require './app/models/node.rb'
require './app/models/statistic.rb'
require 'rails_helper'

describe 'Data Stream Feature tests' do
    it 'processes messages from same node within same minute' do
        message1 = JSON.generate({ "value": {"node_id": "9223372036854775807", "value": 1, "timestamp": "2020-01-03T01:19:13 -01:00"}})
        consumer = NodeDataConsumer.new
        expect(consumer.process(message1)).to be_a(Statistic)
    end

    it 'processes messages from 2 different nodes within same minute' do
        message2 = JSON.generate({ "value": {"node_id": "9223372036854775807", "value": 1, "timestamp": "2020-01-03T01:19:13 -01:00"}})
        consumer = NodeDataConsumer.new
        consumer.process(message2)
    end

    it 'proocesses messages from same node at different minutes' do
        message3 = JSON.generate({ "value": {"node_id": "9223372036854775806", "value": 1, "timestamp": "2020-01-03T01:19:13 -00:00"}})
        consumer = NodeDataConsumer.new
        consumer.process(message3)
    end
end
