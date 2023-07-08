-- SPDX-FileCopyrightText: 2023 perillamint <perillamint@silicon.moe>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

-- This file should undo anything in `up.sql`
DROP TABLE tag_server_bridge CASCADE;
DROP TABLE tags CASCADE;
DROP TABLE servers CASCADE;
