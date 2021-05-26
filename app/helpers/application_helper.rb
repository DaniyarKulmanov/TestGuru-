# frozen_string_literal: true

module ApplicationHelper
  AUTHOR = 'DaniyarKulmanov'
  PROJECT = 'TestGuru-'

  def current_year
    Date.today.year
  end

  def github_url(author, repo = nil)
    "https://github.com/#{author}/#{repo}"
  end
end
