# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    title = question.test.title
    suffix = t('activerecord.models.question.one')

    if question.new_record?
      (t("new", name: title) + ' ' + suffix).capitalize
    else
      (t("edit") + ' ' + title + ' ' + suffix).capitalize
    end
  end
end
