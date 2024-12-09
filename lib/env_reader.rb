# frozen_string_literal: true

require_relative "env_reader/version"

module EnvReader
  class Error < StandardError; end

  class << self
    def read_keys(file_path)
      unless File.exist?(file_path)
        puts "File not found: #{file_path}"
        return
      end

      keys = []

      File.foreach(file_path) do |line|
        next if line.strip.empty? || line.start_with?("#")

        key = line.split("=").first.strip
        keys << key
      end

      # puts "Keys in #{file_path}:"
      # keys.each {|key| puts "-#{key}"}
      keys.each {|key| puts key}
    end
  end
end
