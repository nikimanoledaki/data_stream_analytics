class NodeDataConsumer < Racecar::Consumer
  subscribes_to "some-topic"

  def process(message)
    puts "Received message: #{message.value}"
  end
end
