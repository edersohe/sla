defmodule SLATest do
  use ExUnit.Case
  doctest SLA

  test "greets the world" do
    assert SLA.hello() == :world
  end
end
