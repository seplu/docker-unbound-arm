#!/bin/bash

# Check the configuration for errors
unbound-checkconf

rc-service unbound start
