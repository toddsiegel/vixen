require 'vixen'

class Vixen::CommandLine
  def execute
    command = ARGV.shift
    command ||= 'status'

    begin
      require "vixen/command_line/#{command}"

      klass = self.class.const_get(command.split('_').map {|s| s.capitalize }.join)
      raise "Couldn't find #{command}" unless klass

      klass.new.execute
    rescue LoadError
      puts "Unknown command: #{command}"
    end
  end
end
