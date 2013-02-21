class EnglishController < ApplicationController
  def index
  end

  def translate
    unless params.keys.empty?
      a = Mechanize.new
      regex = %r{\[\s*\[\s*(\[[\w\W]*?\])}
      resp = a.get translateAPI('en', 'ja', params.keys[0])
      ja_result = JSON.parse($1)[0] if resp.body =~ regex

      resp = a.get translateAPI('ja', 'ko', ja_result)
      render inline: JSON.parse($1)[0] if resp.body =~ regex
    end
  end
end
