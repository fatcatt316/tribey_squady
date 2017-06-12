require 'octokit'

module GithubImporter
  extend self

  def update_people
    @email_and_person, @no_email, @email_no_person = [], [], []
    client.organizations.map(&:login).each do |organization_name|
      update_for_organization(organization_name)
    end
    debugger
  end

  private def update_for_organization(organization_name)
    client.organization_members(organization_name).each do |member|
      update_member(member)
    end
  end

  # TODO: Figure out how to match up with people
  private def update_member(member)
    member[:html_url] # e.g., https://github.com/aceofbassgreg
    member[:avatar_url] # e.g., "https://avatars0.githubusercontent.com/u/2547658?v=3"
    member[:login] # github login
    member[:email] # lots of nils... all nils :(

    if member[:email].blank?
      # next unless person
      # person.update!(


      # )
    end
  end

  private def client
    @_client ||= Octokit::Client.new(
      login: ENV['GITHUB_LOGIN'],
      password: ENV['GITHUB_TOKEN']
    )
  end

  # private def anonymous_client
  #   @_client ||= Octokit::Client.new(
  #     client_id: ENV['GITHUB_ID'],
  #     client_secret: ENV['GITHUB_SECRET']
  #   )
  # end
end
