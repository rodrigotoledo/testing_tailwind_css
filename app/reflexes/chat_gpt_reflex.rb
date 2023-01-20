# frozen_string_literal: true

require 'ruby/openai'

class ChatGptReflex < ApplicationReflex
  delegate :uuid, to: :connection

  def submit
    client = OpenAI::Client.new(access_token: ENV.fetch('GPT_KEY', nil))
    response = client.completions(
      parameters: {
        model: 'text-davinci-001',
        prompt: question_params[:q]
        # max_tokens: 5
      }
    )
    morph '#gpt_answer', JSON.parse(response.body)['choices'].pluck('text').to_sentence
  end

  private

  def question_params
    params.require(:question).permit(:q)
  end
end
