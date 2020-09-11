defmodule SLA.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      :poolboy.child_spec(:worker, poolboy_config())
    ]

    opts = [strategy: :one_for_one, name: SLA.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp poolboy_config do
    [
      name: {:local, :worker},
      worker_module: SLA.Worker,
      size: Application.get_env(:sla, :pool_size),
      max_overflow: 0
    ]
  end
end
