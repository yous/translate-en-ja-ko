class ApplicationController < ActionController::Base
  protect_from_forgery

  def translateAPI(from_lang, to_lang, text)
    return "http://translate.google.com/translate_a/t?client=t&text=#{CGI::escape(text)}&hl=#{to_lang}&sl=#{from_lang}&tl=#{to_lang}&ie=UTF-8&oe=UTF-8&multires=1&ssel=0&tsel=0&sc=1"
  end
end
