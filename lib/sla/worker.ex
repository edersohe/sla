defmodule SLA.Worker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    response = :eldap.open(
      ['#{Application.get_env(:sla, :host)}'],
      [{:port, Application.get_env(:sla, :port)}])
    IO.inspect(response)
    case response do
      {:ok, pid} ->
        dsn = '#{Application.get_env(:sla, :bind)}'
        password = '#{Application.get_env(:sla, :password)}'
        response = :eldap.simple_bind(pid, dsn, password)
        case response do
          :ok  -> {:ok, pid}
          {:error, response} -> {:stop, response}
        end
      {:error, response} -> {:stop, response}
    end
  end

  def handle_call({:verify_credentials, username, password}, _from, pid) do
    dsn = '#{Application.get_env(:sla, :identifier)}=#{username},#{Application.get_env(:sla, :base)}'
    response = :eldap.simple_bind(pid, dsn, '#{password}')
    case response do
      :ok  -> {:reply, :ok , pid}
      {:error, :invalidCredentials} -> {:reply, response, pid}
      _ -> {:stop, :shutdown, response, pid}
    end
  end
end
