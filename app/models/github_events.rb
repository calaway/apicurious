class GithubEvents
  def self.fetch_info(user)
    GithubService.get_events(user)
  end

  def self.formatted_events(user)
    raw_events = fetch_info(user)
    raw_events.map do |raw_event|
      {
        type: raw_event["type"].gsub(/[a-z][A-Z]/) do |match|
          "#{match[0]} #{match[1]}"
        end,
        created_at: Time.parse(raw_event["created_at"]),
        repo: raw_event["repo"]
      }
    end
  end
end
