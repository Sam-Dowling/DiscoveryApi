# Service Discovery API

A service that allows external containerized SaaS applications to register their instance with the server and allow other applications to discover these instances through a simple Rest interface.

### Getting Started

Download and install [Elixir](https://elixir-lang.org/)

Install the dependencies by running ```mix deps.get``` and ```mix deps.compile```

Compile the project and run it

```
$ mix compile
$ iex -S mix
```

The service should now be running on ```http://127.0.0.1:8000/```

```
curl 127.0.0.1:8000/heartbeat => 1495984356559000

curl 127.0.0.1:8000/services/CustomerApi => {"service":"CustomerApi", "port":5000, "address":"127.0.0.1"}

```

## Built With

* [Elixir](https://elixir-lang.org/) - A Functional language built on top of the Erlang VM
* [PlugRest](https://github.com/christopheradams/plug_rest) - REST behaviour and Plug router for hypermedia web applications in Elixir

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
