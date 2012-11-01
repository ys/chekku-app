class Guest
  def uid
    nil
  end

  def provider
    'none'
  end

  def avatar_url
    'guest.png'
  end

  def admin?
    false
  end

  def name
    'Sign in with Github'
  end
  alias :message :name
  alias :username :name

  def link
    '/auth/github'
  end

  def has_access?
    false
  end

end
