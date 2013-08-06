require_dependency 'redmine/wiki_formatting/textile/formatter'

module WikiInlineUncHelper
  def auto_unc_link!(text)
    text
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
