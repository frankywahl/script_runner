module ScriptRunner
  class RunScriptJob < ApplicationJob
    queue_as :default

    attr_accessor :user

    def perform(user_id, job_model, *args)
      ScriptRunner.config.around_block(user_id) do
        job = job_model.constantize
        job.perform_now(*args)
      end
    end
  end
end
