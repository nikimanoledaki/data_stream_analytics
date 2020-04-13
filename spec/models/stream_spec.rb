# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stream, type: :model do
  describe '#checkpoint' do
    it 'compares minute of new message with that of previous message' do
      last_message = double('last_message', minute: 0)
      new_message = double('new_message', minute: 0)
      expect(subject.checkpoint(new_message)).to include(new_message)
    end
  end

  describe '#current_batch' do
    it 'groups messages by minute' do
      message1 = { 'node_id' => 18_446_744_073_709_551_615, 'timestamp' => '2020-04-13 12:20:00 +0100', 'value' => 1 }
      subject.current_batch(message1)
      message2 = { 'node_id' => 18_446_744_073_709_551_615, 'timestamp' => '2020-04-13 12:20:01 +0100', 'value' => 1 }
      expect(subject.current_batch(message2)).to eq [message1, message2]
    end
  end
end
