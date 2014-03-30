module Localizable
  def self.included base
    base.before_create :set_locale
  end

  private

  def set_locale
    self.locale = I18n.locale
  end
end
