namespace :slack do
  desc 'Import people from Slack'
  task import_people: :environment do
    time_task do
      print 'Importing people... '
      SlackImporter.import_people
    end
  end

  def time_task
    start_time = Time.current
    yield
    puts "completed in #{(Time.current - start_time).round(2)} seconds."
  end
end
