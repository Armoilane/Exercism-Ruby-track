class LogLineParser

  def initialize(log_line)
    @info_type, @info = log_line.split(':')
  end

  def message
    message ||= @info.strip
  end

  def log_level
    log_level ||= @info_type.slice(/[A-Z]+/).downcase
  end

  def reformat
    '%<message>s (%<log_level>s)' % { message: message.capitalize,
                                    log_level: log_level }
  end

end
