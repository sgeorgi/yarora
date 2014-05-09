module FeatureTestHelper
  def wait_for_ajax
    Timeout.timeout(30) do
      loop do
        return yield if page.evaluate_script('NProgress.status').nil?
        sleep 0.3
      end
    end
  end

  def user_logs_in
    visit '/'
    click_on I18n.t('header.user.login')

    fill_in :user_email, with: 'test@test.com'
    fill_in :user_password, with: 'ABC123xyz!!'

    click_on 'login_button'
    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
  end

  def user_visits_link_in_email(_email)
    _link = URI.extract(_email.body.to_s, ['http', 'https'])[0]
    _uri = URI.parse(_link)
    _path = _uri.path
    _query = _uri.query
    _target = "#{_path}?#{_query}"
    visit _target
  end
end