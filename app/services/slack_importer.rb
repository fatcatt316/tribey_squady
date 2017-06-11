require 'slack'

module SlackImporter
  extend self

  TOKEN = ENV['SLACK_TOKEN']

  def import_people
    client.users_list['members'].each do |member|
      next if skippable?(member)

      person = Person.find_or_initialize_by(email: member['profile']['email'])
      person.update!(
        first_name: member['profile']['first_name'],
        last_name: member['profile']['last_name'],
        slack_name: member['name'],
        active: !member['deleted']
      )
    end
  end

  private def client
    @_client ||= Slack::Client.new(token: TOKEN)
  end

  private def skippable?(member)
    member['is_bot'] || member['is_ultra_restricted']
  end
end
