require_dependency 'redmine/wiki_formatting/textile/formatter'

module WikiInlineUncHelper
  def auto_unc_link_to(body, url)
    escurl  = ERB::Util.html_escape(url)
    escbody = ERB::Util.html_escape(body)
    # TODO: icon for unc link?
    %|<a class="external" href="#{escurl}">#{escbody}</a>|.html_safe
  end
  module_function :auto_unc_link_to
  private_class_method :auto_unc_link_to

  def auto_unc_link!(text)
    # assumes server name is ascii, but paths may contain non-ascii words
    text.gsub!(/(^|[\s>:,.])(\\\\[\w\-.]+\\[[:alnum:][:punct:]\\]+)/) do
      leading, unc = $1, $2
      url = "file:///#{unc.tr('\\', '/')}"
      "#{leading}#{auto_unc_link_to(unc, url)}"
    end
  end
  module_function :auto_unc_link!
end

module WikiInlineUncPatch
  class <<self
    def included(mod)
      mod::RULES << :inline_auto_unc_link
    end
  end

  def inline_auto_unc_link(text)
    WikiInlineUncHelper.auto_unc_link!(text)
  end
  private :inline_auto_unc_link
end
