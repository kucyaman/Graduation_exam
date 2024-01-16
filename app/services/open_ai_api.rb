require 'openai'

class OpenAiApi
  def initialize(client = OpenAI::Client.new)
    @client = client
  end

  def fetch_image_description(image_url)
    messages = [
      { type: :text, text: "What’s in this image? Please describe in about 5 words." },
      { type: :image_url, image_url: { url: image_url } }
    ]

    response = @client.chat(
      parameters: {
        model: "gpt-4-vision-preview",
        messages: [{ role: "user", content: messages }]
      }
    )
    puts "Response: #{response.inspect}"

    response.dig("choices", 0, "message", "content")
  end

  def create_story_with_words(words)
    prompt = "image_descriptions配列のワードを使い、子供向けの短い物語を起承転結の形式で作成してください: #{words.join(' ')}\n\n起:\n承:\n転:\n結:\n"

    response = @client.completions(
      model: "text-davinci-003", # GPT-4モデルの指定
      prompt: prompt,
      max_tokens: 150 # 適宜調整
    )

    response['choices'].first['text'].strip
  end
end
