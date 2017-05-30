# Service Discovery API

A service that allows external containerized SaaS applications to register their instance with the server and allow other applications to discover these instances through a simple Rest interface.

## How to Install

Download and install [Elixir](https://elixir-lang.org/)

Install the dependencies by running `mix deps.get` and `mix deps.compile`

Compile and run the project

```
$ mix phoenix.server
```

The server should now be running on `http://127.0.0.1:8000/`

## Getting Started
```
POST {"address":"127.0.0.1", "port": 4000} -> http://127.0.0.1:8000/api/v1/services/MyService/EU
  => {"address":"127.0.0.1", "port": 4000, "region": "EU"}
```
Register an instance of "MyService" in the EU at 127.0.0.1:4000 by POSTing the JSON object to /api/v1/services/MyService/EU

```
GET 127.0.0.1:8000/api/v1/services
  => ["MyService"]
```
Browse all the services being tracked

```
GET 127.0.0.1:8000/api/v1/services/MyService
  => ["EU"]
```
List all the regions with this service

```
GET 127.0.0.1:8000/api/v1/services/MyService/NA
  => {"address":"127.0.0.1", "port": 4000, "region": "EU"}
```
- Get the address of a service.
- If there is more than one entry for this service in the specified region; a random instance will be returned.
- If there are no instances of the service in the specified region; another region will be picked.

## Built With

- [Elixir](https://elixir-lang.org/) - A Functional language built on top of the Erlang VM
- [Phoenix](http://www.phoenixframework.org) - A productive web framework that does not compromise speed and maintainability.
- [Cachex](https://github.com/zackehh/cachex) - A powerful caching library for Elixir

### Todo

- Add heartbeats to keep listings up to date
- better checking in the repo for duplicate instances
- implement load balancing for getting a service instead of just picking randomly
- ~~add the ability to host by region (eg. /api/v1/services/EU/MyService)~~

### License

This project is licensed under the MIT License - see the <LICENSE> file for details
