require 'spec_helper'
require 'rspec/dom/testing/matchers'

RSpec.describe RSpec::Dom::Testing::Matchers do
  include described_class

  describe('#have_text') do
    context 'label with text' do
      subject { '<label>with text</label>' }
      it { is_expected.to have_text('with text') }
      it { is_expected.to_not have_text('with text', count: 2) }
    end
  end

  describe('#have_tag') do
    context 'label with text' do
      subject { '<label>with text</label>' }
      it { is_expected.to have_tag('label') }
      it { is_expected.to have_tag('label', text: 'with text') }
    end

    context 'list with items' do
      subject { '<ol><li>item 1</li><li>item 2</li></ol>' }
      it { is_expected.to have_tag('li', count: 2) }
      it { is_expected.to_not have_tag('li', count: 3) }
      it { is_expected.to have_tag('li', text: /item 1/, count: 1) }
    end
  end
end
