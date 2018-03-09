class HomeController < ApplicationController
  def index
    @survey = Survey.default

    if cookies[:u_cheeky_fucker].to_i == @survey.id
      redirect_to controller: 'home', action: 'thankyou', survey_id: @survey.id
    end
  end

  def answer
    params[:answers].keys.each do |key|
      Answer.new(question_id: key, selection: params[:answers][key]).save!
    end

    redirect_to controller: 'home', action: 'thankyou', survey_id: Answer.last.question.survey.id
  end

  def thankyou
    cookies.permanent[:u_cheeky_fucker] = params[:survey_id]
  end

  def results
    # cookies.permanent[:u_cheeky_fucker] = params[:survey_id]
    @survey = Survey.find(params[:survey_id])
  end
end
