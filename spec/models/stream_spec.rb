# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stream, type: :model do
  describe '#checkpoint' do
    it 'compares minute of new message with that of previous message' do
      message = double('message', minute: 0)
      batch = double('batch', process: [message])
      batch_type = double('batch_type', new: batch)
      subject = Stream.new(batch_type)
      expect(subject.checkpoint(message)).to eq 0
    end

    it 'processes new batch after one minute' do
      message1 = double('message1', minute: 1)
      message2 = double('message2', minute: 2)
      batch = double('batch', process: [message1])
      batch_type = double('batch_type', new: batch)
      subject = Stream.new(batch_type)
      subject.checkpoint(message1)
      expect(subject.checkpoint(message2)).to eq 2
    end
  end
end
