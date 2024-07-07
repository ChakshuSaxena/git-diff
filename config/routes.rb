Rails.application.routes.draw do
  get 'commits/:user/:repo/:commit_sha', to: 'commits#show', constraints: { repo: /.*/ }
  get 'diff/:user/:repo/:base_commit_sha/:head_commit_sha', to: 'commits#diff', constraints: { repo: /.*/ }
end
