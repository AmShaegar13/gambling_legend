class Guest < User
  after_initialize do
    self.name ||= 'Guest'
    self.password ||= 'blank' # fixes has_secure_password not taking 'unless' option
  end
end
