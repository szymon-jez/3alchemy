defmodule FreeAlchemy do
  # Session 1.1

  def demo1, do: IO.puts "Hello!"

  # Session 1.2

  def demo2(pid) do
    receive do
      msg ->
        send pid, "#{inspect self}: #{inspect pid} #{msg} TRUG!"
    end
    demo2(pid)
  end

  def listen2 do
    receive do
      msg -> IO.inspect msg
    end
    listen2
  end

  # Session 1.3

  def demo3(pid, msg_history \\ "") do
    receive do
      msg ->
        msg_history = msg_history <> " " <> msg
        send pid, "#{inspect self}: #{inspect pid} #{msg} TRUG!"
        send pid, "history: #{msg_history}"
    end
    demo3(pid, msg_history)
  end

  def listen3 do
    receive do
      msg -> IO.inspect msg
    end
    listen3
  end

  # Session 1.4

  def demo4(pid, msg_history \\ "") do
    receive do
      msg ->
        msg_history = "#{msg_history} #{msg}"
        send pid, {:chat, "#{inspect self}: #{inspect pid} #{msg} TRUG!"}
        send pid, {:history, msg_history}
    end
    demo4(pid, msg_history)
  end

  def listen4 do
    receive do
      {:chat, msg} -> IO.puts msg
      {:history, msg_history} -> IO.inspect "history: #{msg_history}"
      _ -> IO.puts "Invalid message!"
    end
    listen4
  end

  # Session 1.5 MessagePingPongRing
  #
  # Use:
  # ring = FreeAlchemy.init_pingpong
  # ring = ring |> Elixchange.add_pingpong |> Elixchange.add_pingpong
  # Elixchange.add_message(ring, "I like")
  # Elixchange.add_message(ring, "Elixir")

  def pingpong do
    receive do
      pid when is_pid(pid) -> pingpong(pid)
    end
  end

  def pingpong(pid) when is_pid(pid) do
    receive do
      new_pid when is_pid(new_pid) ->
        pingpong(new_pid)
      msg ->
        IO.puts "#{inspect self}: #{inspect pid} #{msg}"
        :timer.sleep 1000
        send pid, msg
        pingpong(pid)
    end
  end

  def init_pingpong do
#     Initial version:
#     pp1 = spawn fn -> FreeAlchemy.pingpong end
#     pp2 = spawn fn -> FreeAlchemy.pingpong(pp1) end
#     pp3 = spawn fn -> FreeAlchemy.pingpong(pp2) end
#     send pp1, pp3
#     [pp1, pp2, pp3]
#     After refactoring:
    [spawn fn -> FreeAlchemy.pingpong end]
    |> add_pingpong
    |> add_pingpong
  end

  def add_pingpong([first | _] = ring) do
    pp = spawn fn -> FreeAlchemy.pingpong(List.last(ring)) end
    send first, pp
    IO.puts "Added process #{inspect pp} to ring #{inspect ring}."
    [pp | ring]
  end

  def add_message([first | _], msg) when is_pid(first), do: (send first, msg)
end
