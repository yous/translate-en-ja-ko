class KoreanController < ApplicationController
  def index
  end

  def translate
    unless params.keys.empty?
      a = Mechanize.new
      regex = %r{\[\s*\[\s*(\[[\w\W]*?\])}
      resp = a.get translateAPI('ko', 'ja', params.keys[0])
      ja_result = JSON.parse($1)[0] if resp.body =~ regex

      resp = a.get translateAPI('ja', 'en', ja_result)
      render inline: JSON.parse($1)[0] if resp.body =~ regex
    end
  end
end
