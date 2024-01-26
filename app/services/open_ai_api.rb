require 'openai'

class OpenAiApi
  def initialize(client = OpenAI::Client.new)
    @client = client
  end

  def fetch_image_description(image_urls)
    image_descriptions = []

    image_urls.each do |image_url|
      messages = [
        { type: :text, text: "What’s in this image? Please describe in about 10 words." },
        { type: :image_url, image_url: { url: image_url } }
      ]

      response = @client.chat(
        parameters: {
          model: "gpt-4-vision-preview",
          messages: [{ role: "user", content: messages }]
        }
      )

      description = response.dig("choices", 0, "message", "content")
      image_descriptions << description if description
    end

    image_descriptions
  end

  def create_story(descriptions)
    messages = [
      { type: :text, text: "以下の説明を使って子供向けの物語を作成してください。物語はつながるように作成してください。50文字以内で作成してください。japan only: #{descriptions}\n\n1:\n2:\n3:\n" }
    ]

    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: messages }],
        max_tokens: 200
      }
    )

    response.dig("choices", 0, "message", "content")
  end
end
