module SignInSupport
  def sign_in(user)
    visit root_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_on('Create Account')
    expect(current_path).to eq(root_path)
  end
end