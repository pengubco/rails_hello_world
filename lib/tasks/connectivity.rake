namespace :connectivity do
    desc "Check connectivity to DB and Redis, then exit"
    task check: :environment do
      begin
        # Check Database Connectivity
        ActiveRecord::Base.connection
        puts "Database connection successful."
  
        # Check Redis Connectivity
        $redis.ping
        puts "Redis connection successful."
  
      rescue StandardError => e
        puts "Connectivity check failed: #{e.message}"
        exit(1) # Exit with an error code
      end
  
      puts "All connections successful. Exiting."
      exit(0) # Exit with success code
    end
  end
  