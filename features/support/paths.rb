def path_to address
  case address
  when /the list of (\w+)/
    send "#{ $1 }_path", locale: I18n.locale
  when /the (\w+) page of that (\w+)/
    page = $1
    name = $2.singularize
    subject = name.capitalize.constantize.first
    send "#{ page }_#{ name }_path", subject, locale: I18n.locale
  else
    raise 'Cannot recognize the provided address.'
  end
end
