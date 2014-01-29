require 'embed'
require 'js_builder'

class IssuesController < ApplicationController
  def show
    @repo = params[:repo]
    @issue = params[:issue]
    @embed = IssueEmbed.new(@repo, @issue, @client)
    render json: JSBuilder.new(@embed).output

  # rescue => ex
  #   render json: "Something was not valid. \nRepos should be in the format 'org/repo'.\nIssue numbers should be passed as strings or integers.\n"
  end
end
