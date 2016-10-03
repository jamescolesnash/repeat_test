class RepeatTest
  def run(count = 0, command = "Poop")
    puts "Count: #{count}"
    puts "Command: #{command}"

    pass_num = 0
    fail_num = 0

    for i in 1..count.to_i
      result = `#{command}`

      if $?.success?
        pass_num += 1
      else
        fail_num += 1
      end
    end

    puts "Passes: #{pass_num}"
    puts "Fails: #{fail_num}"
  end
end
