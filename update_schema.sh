#!/bin/bash

# SPDX-FileCopyrightText: 2023 perillamint <perillamint@silicon.moe>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

set -e
cd "$(dirname "$0")"

pushd migrations
diesel migration run
reuse annotate --copyright 'perillamint <perillamint@silicon.moe>' --license AGPL-3.0-or-later src/schema.rs
