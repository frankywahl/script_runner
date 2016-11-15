module ScriptRunner
  class Engine < ::Rails::Engine
    isolate_namespace ScriptRunner
  end
end
