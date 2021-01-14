defmodule SLA.MixProject do
  use Mix.Project

  def project do
    [
      app: :sla,
      version: "0.1.0",
      description: "Simple LDAP authentication with pooling",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SLA.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poolboy, "~> 1.5"},
    ]
  end
end
