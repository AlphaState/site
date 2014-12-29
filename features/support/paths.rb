def path_to address
  case address
  when /^the (.*) page$/
    case $1
    when 'home'
      home_path(locale: I18n.locale)
    when 'sign-in'
      signin_path(locale: I18n.locale)
    when 'sign-out'
      signout_path(locale: I18n.locale)
    else
      raise "Cannot recognize the address '#{address}'."
    end
  when /^the (\w+) page of the (\w+) "(.+)"$/
    action = $1
    resource = $2
    param = $3

    case action
    when 'show'
      action = nil
    end

    subject = resource.capitalize.constantize.find_by_param!(param)

    send("#{[action, resource].compact.join('_')}_path", subject, locale: I18n.locale)
  when /^the (\w+) page of a (\w+)$/
    action = $1
    resource = $2

    case action
    when 'show'
      action = nil
    end

    subject = resource.capitalize.constantize.first

    send("#{[action, resource].compact.join('_')}_path", subject, locale: I18n.locale)
  when /^the (\w+) page of (\w+)$/
    action = $1

    case action
    when 'index'
      action = nil
      resource = $2.pluralize
    else
      resource = $2.singularize
    end

    send("#{[action, resource].compact.join('_')}_path", locale: I18n.locale)
  else
    raise "Cannot recognize the address '#{address}'."
  end
end
