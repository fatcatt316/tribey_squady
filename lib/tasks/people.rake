namespace :people do
  desc 'Update people via Slack'
  task update_via_slack: :environment do
    time_task do
      print 'Updating people via Slack... '
      SlackImporter.update_people
    end
  end

  def time_task
    start_time = Time.current
    yield
    puts "completed in #{(Time.current - start_time).round(2)} seconds."
  end
end
