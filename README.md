# Analog

Simple script to analyze logs formatted like:

```
/path 1.2.3.4
/foo 4.3.2.1
```

## Installation

Checkout the repo and run `./bin/setup`

## Usage

To print out number of visits and unique visits per path call:

```bash
$ ./bin/analog path/to/log
```

## Tests

To run tests just call:

```bash
$ bundle exec rake
```
