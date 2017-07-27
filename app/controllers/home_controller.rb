class HomeController < ApplicationController
  def index
    @survey = Survey.first

    if cookies[:answered].to_i == @survey.id
      redirect_to controller: 'home', action: 'results', survey_id: @survey.id
    end
  end

  def answer
    params[:answers].keys.each do |key|
      Answer.new(question_id: key, selection: params[:answers][key]).save!
    end

    redirect_to controller: 'home', action: 'results', survey_id: Answer.last.question.survey.id
  end

  def results
    cookies.permanent[:answered] = params[:survey_id]
    @survey = Survey.find(params[:survey_id])
  end
end
