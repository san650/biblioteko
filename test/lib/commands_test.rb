require "test_helper"
require "commands"

class CommandsTest < ActiveSupport::TestCase
  test "generates a two level menu" do
    commands = Commands.new
    commands.draw do
      help do
        all "Returns all books"
        search "Search books"
      end

      all
      search :term
      borrow { |book_id| }
    end

    root = commands.root

    refute_nil root
    assert_equal 4, root.nodes.size

    node = root.nodes[0]
    assert_equal :help, node.name
    assert_equal 2, node.nodes.size
    assert_empty node.params

    node = root.nodes[1]
    assert_equal :all, node.name
    assert_empty node.nodes
    assert_empty node.params

    node = root.nodes[2]
    assert_equal :search, node.name
    assert_equal [:term], node.params

    node = root.nodes[3]
    assert_equal :borrow, node.name
    assert_empty node.nodes
    assert_equal [:book_id], node.params
  end
end
