class ApplicationController < ActionController::API
  before_filter :set_client

  def set_client
    @client = Octokit::Client.new \
      client_id:     ENV["OCTOKIT_KEY"],
      client_secret: ENV["OCTOKIT_SECRET"],
      default_media_type: "application/vnd.github.VERSION.html+json"
  end
end
