class RepeatTest
  def run(count, command, output_all)
    pass_num = 0
    fail_num = 0
    estimate = 0
    
    count.times do |i|
      failure_message = ""
      remaining = count - (i + 1)
      start_time = Time.now
      result = `#{command}`
      puts result if output_all == true
      estimate = (Time.now - start_time).to_i * remaining

      if (command.include? "rspec")
        result_line = result[/.*example(s\b|\b).*/]
        pass_num += result_line[/\d+/].to_i

        failures = result_line[/(\d+)(?!.*\d)/].to_i
        fail_num += failures
        failure_message += result if failures != 0
      else
        if $?.success?
          pass_num += 1
        else
          fail_num += 1
          failure_message += $?.to_s
          echo $? || true
        end
      end
      STDOUT.puts "Failure Message: #{failure_message}" if failure_message != ""
      STDERR.print "\r#{pass_num} passed, #{fail_num} failed, #{estimate}s remaining"
      STDERR.print "\n"
    end
  end
end
