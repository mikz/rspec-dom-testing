require 'rspec/matchers/dsl'
require 'rails-dom-testing'

module RSpec
  module Dom
    module Testing
      module Matchers
        extend ::RSpec::Matchers::DSL

        EMPTY_OPTIONS = {}.freeze

        module Helper
          include ::Rails::Dom::Testing::Assertions::SelectorAssertions

          def matches?(actual, &block)
            @actual = actual
            @match = :to

            match(expected, block)
          end

          def does_not_match?(actual, &block)
            @actual = actual
            @match = :not_to

            match(expected, block)
          end

          def wrap(actual)
            case actual
            when String
              ::Nokogiri::HTML::Document.parse("<html>#{actual}</html>")
            else
              nodeset(actual)
            end
          end

          def document_root_element
            wrap(actual)
          end

          def assert_operator(n1, op, n2, message)
            expect(n1).public_send(@match, be.public_send(op, n2), message)
          end

          def assert_equal(a, b, message)
            expect(a).public_send(@match, eq(b), message)
          end
        end

        define :have_text do
          include Helper

          def match(expected, _block)
            text, options = expected
            assert_select('*', text: text, **(options || EMPTY_OPTIONS))
          end
        end

        define :have_tag do
          include Helper

          def match(expected, block)
            assert_select(*expected) do |matches|
              if block
                scope = block.binding.eval('self')
                scope.instance_exec(matches, &block)
              end
            end
          end
        end
      end
    end
  end
end
