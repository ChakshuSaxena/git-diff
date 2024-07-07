require 'octokit'

class GithubService
  def initialize(user, repo)
    @client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
    @repo = "#{user}/#{repo}"
  end

  def get_commit(commit_sha)
    @client.commit(@repo, commit_sha)
  end

  def get_diff(base_commit_sha, head_commit_sha)
    @client.compare(@repo, base_commit_sha, head_commit_sha)
  end
end
