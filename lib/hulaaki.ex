defmodule Hulaaki do
  alias Hulaaki.Message
  alias Hulaaki.Encoder
  alias Hulaaki.Decoder

  defprotocol Packet do
    def encode(message)
    def decode(message)
  end

  defimpl Packet, for: BitString do
    def encode(binary), do: binary
    def decode(binary) do
      Decoder.decode(binary)
    end
  end

  defimpl Packet, for: Message.Connect do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message) <>
        Encoder.encode_payload(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.ConnAck do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.Publish do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message) <>
        Encoder.encode_payload(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.PubAck do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.PubRec do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.PubRel do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.PubComp do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.Subscribe do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message) <>
        Encoder.encode_payload(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.SubAck do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message) <>
        Encoder.encode_payload(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.Unsubscribe do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message) <>
        Encoder.encode_payload(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.UnsubAck do
    def encode(message) do
      Encoder.encode_fixed_header(message) <>
        Encoder.encode_variable_header(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.PingReq do
    def encode(message) do
      Encoder.encode_fixed_header(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.PingResp do
    def encode(message) do
      Encoder.encode_fixed_header(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end

  defimpl Packet, for: Message.Disconnect do
    def encode(message) do
      Encoder.encode_fixed_header(message)
    end
    def decode(message), do: %{message: message, remainder: <<>>}
  end
end
