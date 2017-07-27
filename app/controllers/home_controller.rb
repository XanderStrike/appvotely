class HomeController < ApplicationController
  def index
    @survey = Survey.first
  end

  def answer
    params[:answer].keys.each do |x|
      Answer.new(question_id: x, selection: params[:answer][x][:answer]).save!
    end

    redirect_to controller: 'home', action: 'results', survey_id: Answer.last.question.survey.id
  end

  def results
    @survey = Survey.find(params[:survey_id])
  end
end
