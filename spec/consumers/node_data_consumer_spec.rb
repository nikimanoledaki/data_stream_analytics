# frozen_string_literal: true

require 'rails_helper'

describe NodeDataConsumer do
  it 'processes new message' do
    message = JSON.generate({ "value": { "node_id": '9223372036854775807', "value": 1, "timestamp": '2020-01-03T01:19:13 -00:00' } })
    new_message = double('new_message', new: { 'node_id' => '9223372036854775807', 'timestamp' => '2020-01-03T01:19:13 -00:00', 'value' => 1 })
    stream = double('stream', checkpoint: new_message.new)
    consumer = NodeDataConsumer.new(stream)

    expect(consumer.process(message, new_message)).to eq 'node_id' => '9223372036854775807', 'timestamp' => '2020-01-03T01:19:13 -00:00', 'value' => 1
  end
end
