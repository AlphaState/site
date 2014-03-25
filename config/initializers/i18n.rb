module I18n
  def self.default_locale?
    self.locale == self.default_locale
  end

  def self.alternative_locale
    self.available_locales.find { |l| l != self.default_locale }
  end
end
