# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo = nil)
    title = repo.nil? ? "Автор #{author}" : "Проект #{repo}"
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
