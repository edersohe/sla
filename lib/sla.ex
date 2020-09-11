defmodule SLA do

  def verify_credentials(username, password) do
    :poolboy.transaction(
      :worker,
      fn pid -> GenServer.call(pid, {:verify_credentials, username, password}) end
    )
  end
end
