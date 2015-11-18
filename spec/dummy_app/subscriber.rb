class Subscriber
  include Sidekiq::Worker
  def self.it_happened(message)
    File.open('/tmp/shared', 'w') do |file|
      file.puts "pid: #{Process.pid}"
    end
  end
  
  def perform(event_name, *args)
    self.class.send(event_name, args)
  end
end
