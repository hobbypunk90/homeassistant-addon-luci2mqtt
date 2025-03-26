# frozen_string_literal: true

class Mqtt::Actor < Actor
  def client
    @@client = MQTT::Client.connect(
      host: Settings.mqtt.host,
      port: Settings.mqtt.port,
      ssl: Settings.mqtt.ssl,
      username: Settings.mqtt.username,
      password: Settings.mqtt.password,
    )
  end

  def retain
    Settings.mqtt.retain
  end

  def publish(topic, payload)
    client.publish(topic, payload, retain)
  end
end
