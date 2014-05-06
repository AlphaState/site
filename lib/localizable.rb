module Localizable
  def self.included base
    base.before_validation :set_locale
  end

  private

  def set_locale
    self.locale = I18n.locale if self.locale.blank?
  end
end
