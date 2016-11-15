# ScriptRunner

!!!STOP CONNECTING TO PRODUCTION!!!

ScriptRunner is a tool that can be mounted on a rails application. It allows it's user to run arbitrary jobs.

It order to run code / migration in production, one now has to create an `ActiveJob` the standard way, get it merged and run it with this tool.

This is great for one-off scripts, or fixing that problem in production, but have a trace of how it was fixed (after all, you are using revision control right?).

## Usage

By default, ScriptRunner will look in the `/app/jobs/` directory for relevant jobs.

If you wish to add a folder where you obs are located, in your initializer you can use:

```ruby
ScriptRunner.config do |c|
	c.jobs_paths << Rails.root.join('path', 'to', 'my', 'folder')
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'script_runner', github: 'frankywahl/script_runner'
```

Now, in your routes:

```ruby
mount ScriptRunner::Engine => "/script_runner" #or any other path
```

Now you can visit `http://<you_url>/script_runner` to enqueue a job

## Notes
ScriptRunner will require all your Jobs before loading instead of counting on Rails lazy loading. This could have an small performance affect on your application based on how many jobs get loaded into memory.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
