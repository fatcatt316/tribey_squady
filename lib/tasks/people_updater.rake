namespace :people_updater do
  desc 'Update people via Slack'
  task slack: :environment do
    time_task do
      print 'Updating people via Slack... '
      SlackImporter.update_people
    end
  end

  desc 'Update people via Github'
  task github: :environment do
    time_task do
      print 'Updating people via Github... '
      GithubImporter.update_people
    end
  end

  def time_task
    start_time = Time.current
    yield
    puts "completed in #{(Time.current - start_time).round(2)} seconds."
  end
end
