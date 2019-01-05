# IRB Lambda

A Lambda function to run one line of Ruby at a time

## Limitations

This works only with the standard library. There are no dependencies for this
function.

## Requirements

You will need to have AWS credentials for the `./bin/sync` command to work. You
can set them up over here:

    $ cat ~/.aws/credentials
    [default]
    aws_access_key_id = <replace me with a valid access key>
    aws_secret_access_key = <replace me with a valid secret access key>

## Setup

Just run:

    ./bin/setup

## Testing

You can run `rake` or `rspec` to run the test suite.

## Deploying

You can run this script to update the function in AWS:

    ./bin/sync

## Roadmap

- More user-friendly error messages and stack traces.
- More tests
