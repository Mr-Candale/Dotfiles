
defmodule Spinner do
  @spinner ~w(| / - \\)

  def start do
    spawn_link(fn -> spin(0) end)
  end

  defp spin(i) do
    print_spinner(Enum.at(@spinner, i))
    :timer.sleep(100)
    spin((i + 1) |> rem(4))
  end

  defp print_spinner(char) do
    IO.write("\r#{char}")
  end
end

Spinner.start()

Process.sleep(:infinity)
.sleep(:infinity)

