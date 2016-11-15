require "script_runner/engine"

module ScriptRunner
  class Configuration
    attr_accessor :jobs_path
    def initialize
      @jobs_path = [Rails.root.join('app', 'jobs')]
    end
  end

  def self.config(&block)
    @config ||= Configuration.new
    yield @config if block_given?
    @config
  end
end
