#! /bin/bash

brew install --cask snowflake-snowsql
snowsql -v

echo "Add your Snowflake account via config file located at `~/.snowsql/config`"
