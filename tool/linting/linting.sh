#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# pylint
pylint $(find python/ test/python/ examples/ -name '*.py')
LINTRESULT=$?
if [ $LINTRESULT == 0 ]; then
  echo "pylint passed"
else
  echo "pylint not passed"
  exit $LINTRESULT
fi

# cpplint
CPPLINTRESULT=$(cpplint --quiet $(find src/ include/ test/singa/ -name *.cc -or -name *.h) )
if [[ $CPPLINTRESULT ]]; then
  echo $CPPLINTRESULT
  echo "cpplint not passed"
  exit 1
else
  echo "cpplint passed"
fi

exit 0