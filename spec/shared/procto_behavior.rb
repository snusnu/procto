# encoding: utf-8

shared_context 'procto' do
  let(:text)     { 'world' }
  let(:expected) { "Hello #{text}" }

  it 'returns the correct value' do
    expect(subject).to eql(expected)
  end
end
