-- SPDX-FileCopyrightText: 2023 perillamint <perillamint@silicon.moe>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

-- This file should undo anything in `up.sql`
DROP TABLE tag_subscription CASCADE;
DROP TABLE server_subscription CASCADE;
DROP TABLE subscription_cfg CASCADE;
