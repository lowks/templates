defmodule Sugar.Templates.Engine do
  @moduledoc """
  Specification of the template engine API implemented
  by individual template engines.
  """
  use Behaviour

  @type template :: Sugar.Templates.Template.t
  @type reason   :: String.t
  @type vars     :: list | Keyword.t

  @doc """
  Compiles a `template`.

  It is advised that an engine implementation removes the template
  source from the struct if it is not needed after compilation but
  retain it if needed for rendering.
  """
  defcallback compile(template) :: {:ok, template} | {:error, reason}

  @doc """
  Renders a compiled template based on the given `template` struct.
  """
  defcallback render(template, vars) :: {:ok, iodata}
end
