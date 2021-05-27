# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo = nil)
    "https://github.com/#{author}/#{repo}"
  end
end
