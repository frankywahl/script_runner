require_dependency "script_runner/application_controller"

module ScriptRunner
  class JobsController < ApplicationController
    ScriptRunner.config.jobs_path.each { |path|
      Dir[path.join('**', '*.rb')].each { |x| require x }
    }

    before_action :set_job, only: [:show, :edit, :update, :destroy]

    # GET /jobs
    def index
      @jobs = ApplicationJob.descendants.reject { |x| x == RunScriptJob }
    end

    # GET /jobs/new
    def new
      @jobs = ApplicationJob.descendants.reject { |x| x == RunScriptJob }
    end

    # POST /jobs
    def create
      current_user = send(ScriptRunner.config.current_user_method) || OpenStruct.new(id: nil)
      RunScriptJob.perform_later(current_user.id, job_params.to_s, job_params)
      redirect_to jobs_path, notice: 'Job succesffully enqueued'
    end

    private

    def job_params
      params.fetch(:job, {})
    end
  end
end
