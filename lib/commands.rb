class Commands
  class Node
    attr_reader :name, :params
    attr_accessor :nodes

    def initialize(name, params)
      @name, @params, @nodes = name, params, []
    end
  end

  class Builder
    class Parser
      attr_reader :nodes

      def initialize(&block)
        @block = block
        @nodes = []
      end

      def parse!
        instance_eval(&@block) if @block
      end

      def respond_to_missing?(m, include_private = false)
        true
      end

      def method_missing(m, *args, &block)
        if args.size > 0
          params = args
        elsif block
          params = block.parameters.map { |p| p.last }
        else
          params = []
        end

        node = Node.new(m, params)

        if block_given?
          parser = Parser.new(&block)
          parser.parse!
          node.nodes = parser.nodes
        end

        @nodes << node

        nil
      end
    end

    def initialize(&b)
      @block = b
    end

    def parse
      parser = Parser.new(&@block)
      root = Node.new(:root, nil)
      parser.parse!
      root.nodes = parser.nodes

      root
    end
  end

  attr_reader :root

  def initialize
    @root = nil
  end

  def draw(&b)
    builder = Builder.new(&b)
    @root = builder.parse
  end
end
