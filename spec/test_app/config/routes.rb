Rails.application.routes.draw do
  mount ScriptRunner::Engine => "/script_runner"
end
