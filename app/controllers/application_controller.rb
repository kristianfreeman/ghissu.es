class ApplicationController < ActionController::API
  before_filter :set_client

  def set_client
    @client = Octokit::Client.new \
      client_id:     Figaro.env.octokit_key,
      client_secret: Figaro.env.octokit_secret,
      default_media_type: "application/vnd.github.VERSION.html+json"
  end
end
