defmodule Clock do
  alias GenserverStack
  alias GenserverStack.Server

  def start do
    case GenserverStack.start do
      {:ok, pid} ->
        GenserverStack.push(1)
        Server.schedule_process(pid)
      _ ->
       stop()
       start()
    end
  end

  def stop do
    GenserverStack.stop
  end
end
