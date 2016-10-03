class RepeatTest
  def run(count, command)
    pass_num = 0
    fail_num = 0
    failure_message = ""

    count.times do |i|
      remaining = count - (i + 1)
      start_time = Time.now
      result = `#{command}`
      estimate = (Time.now - start_time).to_i * remaining

      if (command.include? "rspec")
        result_line = result[/.*examples.*/]
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
        end
      end
      STDERR.print "\r#{pass_num} passed, #{fail_num} failed, #{estimate}s remaining"
    end

    STDERR.print "\n"
    STDOUT.puts failure_message if failure_message != ""
  end
end
