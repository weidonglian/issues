defmodule CliTest do
  use ExUnit.Case

  import Issues.Cli, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
    assert parse_args([]) == :help
    assert parse_args(["user"]) == :help
    assert parse_args(["project"]) == :help
    assert parse_args(["user", "project"]) != :help
  end

  test ":three values retruned if three given" do
    assert parse_args(["user", "project", 99]) == {"user", "project", 99}
  end

  test "count if defaulted if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end
