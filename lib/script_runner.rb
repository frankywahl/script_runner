require "script_runner/engine"

module ScriptRunner
  class Configuration
    attr_accessor :jobs_path, :current_user_method

    def initialize
      @jobs_path = [Rails.root.join('app', 'jobs')]
      @current_user_method = :current_user
    end

    def around_block(user_id, &block)
      @setup_block.call(user_id, block)
    end

    def around_job(&block)
      @setup_block = block
    end
  end

  def self.config(&block)
    @config ||= Configuration.new
    yield @config if block_given?
    @config
  end
end
