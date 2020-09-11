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
config :sla,
  host: "127.0.0.1",
  base: "ou=people,dc=example,dc=com",
  port: 389,
  pool_size: 10
```

Usage `iex -S mix`

```
SLA.verify_credendials("my_username", "my_password")
```

