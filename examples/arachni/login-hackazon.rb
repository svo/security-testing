response = http.post( 'http://security-testing-victim.local:3002/user/login', parameters: {
  'username' => 'test_user',
  'password' => '123456'},
  mode: :sync,
  update_cookies: true)

framework.options.session.check_url = 'http://security-testing-victim.local:3002/account'
framework.options.session.check_pattern = /My Account/
