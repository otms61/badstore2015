require 'spec_helper'

feature 'new_items.php', js: true do
  scenario 'ページが表示される' do
    visit 'http://localhost:5000/new_items.php?isNew=Y'
    trs = page.all :xpath, '//tr'
    expect(trs.count).to eq 9
  end

  scenario 'UNION SQL INJECTION' do
    url = "http://localhost:5000/new_items.php?isNew=Y' UNION ALL SELECT 1,1,1,'1"
    visit URI.encode(url)
    trs = page.all :xpath, '//tr'
    expect(trs.count).to eq 10
  end
end