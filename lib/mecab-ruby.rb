require 'MeCab'
#require File.join(File.dirname(__FILE__), %w[.. MeCab])

module MeCab
  class Nodes
    include Enumerable

    def initialize(nodes)
      @nodes = nodes
    end

    def each(&block)
      node = @nodes
      while node do
        block.call node
        node = node.next
      end
    end
  end

  class Tagger
    def parse_to_nodes(text)
      Nodes.new parseToNode(text)
    end
  end
end
