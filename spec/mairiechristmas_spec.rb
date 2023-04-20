require_relative '../lib/mairiechristmas'

describe 'the URL_collect method' do
  it 'should return an array with every URL of every town in the "Val dOise" department' do
    expect(url_collect).to_not be_empty
    expect(url_collect).to include("/95/avernes.html","/95/fontenay-en-parisis.html")
  end
end

describe 'the email_collect method' do
  it 'should return an array with the mail of the URL in argument' do
    expect(email_collect("/95/fontenay-en-parisis.html")).to_not be_empty
    expect(email_collect("/95/fontenay-en-parisis.html")).to include("mairiefontenay@roissy-online.com")
  end
end

describe 'the mail_crawl method' do
  it 'should return an array with every emails of every URL from the url_collect method' do
    expect(mail_crawl).to_not be_empty
    expect(mail_crawl).to include(["mairiefontenay@roissy-online.com"],["mairie.ableiges95@wanadoo.fr"])
  end
end

describe 'the names_collect method' do
  it 'should return an array with every names of every town in the Val dOise department' do
    expect(names_collect).to_not be_empty
    expect(names_collect).to include("ABLEIGES","ERAGNY SUR OISE")
  end
end

describe 'the from_names_and_mails_to_ashes method' do
  it 'should return an hash with every towns names associated with their respective emails' do
    expect(from_names_and_mails_to_ashes(names_collect,mail_crawl)).to_not be_empty
  end
end