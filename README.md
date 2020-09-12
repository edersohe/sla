# SLA

**Simple LDAP Authentication**

## Installation

Add to dependencies into `mix.exs`:

```elixir
def deps do
  [
    {:sla, "~> 0.1.0"}
  ]
end
```

Add config app into `config/config.exs`

```elixir
# test server https://www.forumsys.com/tutorials/integration-how-to/ldap/online-ldap-test-server/
config :sla,
  host: "ldap.forumsys.com",
  base: "dc=example,dc=com",
  identifier: "uid",
  bind: "cn=read-only-admin,dc=example,dc=com",
  password: "password",
  port: 389,
  pool_size: 2
```

Usage `iex -S mix`

```
SLA.verify_credendials("einstein", "password")
```

## TODO

* SSL Support

