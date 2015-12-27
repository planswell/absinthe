defmodule Absinthe.Type.ObjectType do

  alias Absinthe.Type

  @type t :: %{name: binary, description: binary, fields: map, interfaces: [Absinthe.Type.Interface.t], is_type_of: ((any) -> boolean), reference: Type.Reference.t}
  defstruct name: nil, description: nil, fields: nil, interfaces: [], is_type_of: nil, reference: nil

  def field(%{fields: fields}, field_name) do
    fields
    |> Map.get(field_name)
  end

  defimpl Absinthe.Traversal.Node do
    def children(node, _traversal) do
      node.fields
      |> Map.values
    end
  end

end