class JSBuilder
  attr_accessor :issue
  def initialize(issue)
    self.issue = issue
  end

  def output
    @out = <<EOF
document.write("<link rel='stylesheet' type='text/css' href='https://github.global.ssl.fastly.net/assets/github-8ade070a1b3e2394638bbec2ae5539fd287de00e.css'>");
document.write("<link rel='stylesheet' type='text/css' href='http://localhost:3000/assets/embed.css'>");
document.write("<div class='timeline-comment'><div class='comment'>");
document.write("<div class='timeline-comment-header'><div class='timeline-comment-header-text'><strong><a href='#{ issue.url }'>#{ issue.title }</a></strong> started by <a href='#{ issue.user_url }'>#{ issue.user.login }</a><div style='float: right;' class='gh-header-status #{ issue.state }'>#{ issue.state.capitalize }</div><br /><a href='#{ issue.repo_url }'>#{ issue.repo }</a> ##{ issue.issue_number }</div></div>");
document.write("<div class='comment'><div class='comment-content'><div class='comment-body'>#{ issue.safe_body }</div></div></div>");
document.write("</div></div>");
EOF
    @out
  end
end
