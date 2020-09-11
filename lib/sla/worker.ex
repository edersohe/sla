defmodule SLA.Worker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    response = :eldap.open(
      ['#{Application.get_env(:sla, :host)}'],
      [{:port, Application.get_env(:sla, :port)}])
    case response do
      {:ok, _} -> response
      {:error, response} -> {:stop, response}
    end
  end

  def handle_call({:verify_credentials, username, password}, _from, pid) do
    response = :eldap.simple_bind(pid,
      '#{Application.get_env(:sla, :identifier)}=#{username},#{Application.get_env(:sla, :base)}', '#{password}'
    )
    case response do
      :ok  -> {:reply, :ok , pid}
      {:error, :invalidCredentials} -> {:reply, response, pid}
      _ -> {:stop, :shutdown, response, pid}
    end
  end
end
