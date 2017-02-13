class Output

  def initialize(file)
    @file = file
    @controller = controller
  end

  def append_output_to_file(output)
    open(@file, 'a') do |file|
      file.puts "Expected Output:"
      file << output
    end
  end
end
