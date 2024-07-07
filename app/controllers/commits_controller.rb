# app/controllers/commits_controller.rb
class CommitsController < ApplicationController
  rescue_from Octokit::NotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :bad_request

  def show
    user = params.require(:user)
    repo = params.require(:repo)
    commit_sha = params.require(:commit_sha)
    service = GithubService.new(user, repo)

    commit = service.get_commit(commit_sha)
    render json: commit
  end

  def diff
    user = params.require(:user)
    repo = params.require(:repo)
    base_commit_sha = params.require(:base_commit_sha)
    head_commit_sha = params.require(:head_commit_sha)
    service = GithubService.new(user, repo)

    diff = service.get_diff(base_commit_sha, head_commit_sha)
    render json: diff
  end

  private

  def not_found
    render json: { error: 'Not found' }, status: :not_found
  end

  def bad_request(exception)
    render json: { error: exception.message }, status: :bad_request
  end
end
