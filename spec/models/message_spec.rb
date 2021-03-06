# frozen_string_literal: true

require 'rails_helper'
require './lib/message.rb'

RSpec.describe Message do
  describe '#validate_time' do
    it 'returns the timestamp as a Time object' do
      message = { 'node_id' => 9223372036854775807, 'timestamp' => '2020-01-03T01:19:13 -00:00', 'value' => 1 }
      subject = Message.new(message)
      expect(subject.validate_time).to be_a(Time)
    end
  end

  describe '#minute' do
    it 'returns the minute as an integer' do
      message = { 'node_id' => 9223372036854775807, 'timestamp' => '2020-01-03T01:19:13 -00:00', 'value' => 1 }
      subject = Message.new(message)
      expect(subject.minute).to eq 0
    end
  end

  describe '#node_id' do
    it 'returns the node_id as an Integer' do
      subject = Message.new({ 'node_id' => '9223372036854775807', 'timestamp' => '2020-01-03T01:19:13 -00:00', 'value' => 1 })
      expect(subject.node_id).to be_a(Integer)
    end
  end
end
