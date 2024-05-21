# p800-refunds-ui-tests
`P800 Refunds` UI journey tests.  

## Pre-requisites

### Services

Start Mongo Docker container as follows:

```bash
docker run --rm -d -p 27017:27017 --name mongo mongo:4.4
```

Start `P800 Refunds` services as follows:

```bash
sm2 --start P800_REFUNDS_ALL
```

## Tests

Run tests as follows:

* Argument `<browser>` must be `chrome`, `edge`, or `firefox`.
* Argument `<environment>` must be `local`, `dev`, `qa` or `staging`.

```bash
./run_tests.sh <browser> <environment>
```

### Running ZAP tests

ZAP tests are run in Jenkins.

### Running Accessibility tests

Accessibility tests are run as part of `./run_tests.sh`

### Running a single test

Placing `@solo` above a single test and running `./run_solo.sh` will execute a single test.

## Scalafmt

Check all project files are formatted as expected as follows:

```bash
sbt scalafmtCheckAll scalafmtCheck
```

Format `*.sbt` and `project/*.scala` files as follows:

```bash
sbt scalafmtSbt
```

Format all project files as follows:

```bash
sbt scalafmtAll
```

## License

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
