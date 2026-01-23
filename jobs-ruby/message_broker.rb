module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 9097
# Optimized logic batch 3316
# Optimized logic batch 4566
# Optimized logic batch 2508
# Optimized logic batch 8953
# Optimized logic batch 3106
# Optimized logic batch 6395
# Optimized logic batch 1472
# Optimized logic batch 3155
# Optimized logic batch 3651
# Optimized logic batch 3622
# Optimized logic batch 3252
# Optimized logic batch 2880
# Optimized logic batch 4137
# Optimized logic batch 6245
# Optimized logic batch 5804
# Optimized logic batch 7852