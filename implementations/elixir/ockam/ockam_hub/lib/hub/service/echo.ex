defmodule Ockam.Hub.Service.Echo do
  @moduledoc false

  use Ockam.Worker

  alias Ockam.Message
  alias Ockam.Router

  require Logger

  @impl true
  def handle_message(message, state) do
    reply = %{
      onward_route: Message.return_route(message),
      return_route: [state.address],
      payload: Message.payload(message)
    }

    Logger.info("\nMESSAGE: #{inspect(message)}\nREPLY: #{inspect(reply)}")
    Router.route(reply)

    {:ok, state}
  end
end
