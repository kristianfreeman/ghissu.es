require 'octokit'

class IssueEmbed
  attr_accessor :issue, :repo, :issue_number
  def initialize(repo, issue_number, client)
    self.repo = repo
    self.issue_number = issue_number
    self.issue = client.issue(repo, issue_number)
  end

  def repo_url
    "https://github.com/#{repo}/"
  end

  def url
    repo_url + "issues/#{issue_number}"
  end

  def user_url
    "https://github.com/#{issue.user.login}"
  end

  def safe_body
    self.issue.body_html.gsub('"', '\"')
      .gsub("\n", "<br />")
      .gsub("p><br /><br />", "p>")
      .gsub("pre><br /><br />", "pre>")
  end

  def method_missing(m, *args, &blk)
    if self.issue.respond_to? m
      self.issue.send m
    else
      puts "Don't know #{ m }"
    end
  end
end
