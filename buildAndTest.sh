#!/bin/bash
make clean && WRITE_JUNIT_XML=YES JUNIT_XML_DIR=build/test-results make test
