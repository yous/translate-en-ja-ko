class KoreanController < ApplicationController
  def index
  end

  def translate
    unless params.keys.empty?
      a = Mechanize.new
      regex = %r{\[\s*\[\s*(\[[\w\W]*?\])}
      resp = a.get "http://translate.google.com/translate_a/t?client=t&text=#{CGI::escape(params.keys[0])}&hl=ja&sl=ko&tl=ja&ie=UTF-8&oe=UTF-8&multires=1&ssel=0&tsel=0&sc=1"
      ja_result = JSON.parse($1)[0] if resp.body =~ regex

      resp = a.get "http://translate.google.com/translate_a/t?client=t&text=#{CGI::escape(ja_result)}&hl=en&sl=ja&tl=en&ie=UTF-8&oe=UTF-8&multires=1&ssel=0&tsel=0&sc=1"
      render inline: JSON.parse($1)[0] if resp.body =~ regex
    end
  end
end
