defmodule LDAPAuthTest do
  use ExUnit.Case
  doctest LDAPAuth

  test "greets the world" do
    assert LDAPAuth.hello() == :world
  end
end
