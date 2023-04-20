require_relative '../lib/coinmarket'

describe 'the names_collect method' do
  it 'should return an array with 20 or so crypto names' do
    expect(names_collect).to_not be_empty
    expect(names_collect).to include("Bitcoin","Ethereum","XRP")
  end
end

describe 'the prices_collect method' do
  it 'should return an array with 20 or so crypto prices' do
    expect(prices_collect).to_not be_empty
  end
end

describe 'the result method' do
  it 'should return an hash composed from names_collect and prices_collect' do
    expect(from_names_and_prices_to_ashes(names_collect,prices_collect)).to_not be_empty
    expect(from_names_and_prices_to_ashes(names_collect,prices_collect)).to have_key('XRP')
  end
end