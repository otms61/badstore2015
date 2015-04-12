feature 'Access from Home', js: true do
  before :all do
    web_root = File.join(Dir.pwd, 'www')
    @web_server = Open3.popen3("php -S localhost:5000 -t #{web_root}")
  end

  before do
    visit '/'
  end

  after do
    expect(title).to eq 'Welcome to BadStore2015!'
  end

  scenario 'index.php' do
    expect(page.current_path).to eq '/'
  end


  scenario 'click ホーム' do
    click_link 'ホーム'
    expect(page.current_url).to eq path_join('index.php')
  end

  scenario 'click 新しい品物！' do
    click_link '新しい品物！'
    expect(page.current_url).to eq path_join('new_items.php?isNew=Y')
  end

  scenario 'click メッセージを残す' do
    click_link 'メッセージを残す'
    expect(page.current_url).to eq path_join('guestbook.php')
    expect(title).to eq 'Welcome to BadStore2015!'
  end


  scenario 'click ログイン・登録' do
    click_link 'ログイン・登録'
    expect(page.current_url).to eq path_join('login_register.php')
  end

  scenario 'click ログアウト' do
    click_link 'ログアウト'
    expect(page.current_url).to eq path_join('index.php')
  end


  context 'before login' do
    scenario 'click 購入履歴' do
      click_link '購入履歴'
      expect(page.current_url).to eq path_join('login_register.php')
    end
  end


  after(:all) do
    Process.kill('KILL', @web_server[3].pid)
  end
end
