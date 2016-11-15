require_dependency "script_runner/application_controller"

module ScriptRunner
  class JobsController < ApplicationController
    ScriptRunner.config.jobs_path.each { |path|
      Dir[path.join('**', '*.rb')].each { |x| require x }
    }

    before_action :set_job, only: [:show, :edit, :update, :destroy]

    # GET /jobs
    def index
      @jobs = ApplicationJob.descendants
    end

    # GET /jobs/1
    def show
    end

    # GET /jobs/new
    def new
      @jobs = ApplicationJob.descendants
    end

    # POST /jobs
    def create
      job = job_params.constantize
      job.perform_later
      redirect_to jobs_path, notice: 'Job succesffully enqueued'
    end

    private

    def job_params
      params.fetch(:job, {})
    end
  end
end
