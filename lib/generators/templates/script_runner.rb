ScriptRunner.config do |c|
  # Example of what is already in
  # c.jobs_path << Rails.root.join('app', 'jobs')

  c.current_user_method = :current_user # default

  c.around_job do |user_id, block|
    # Do something before the script runs
    block.call
    # Do something after the script runs
  end
end
