-- SPDX-FileCopyrightText: 2023 perillamint <perillamint@silicon.moe>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

-- Your SQL goes here
CREATE TABLE subscription_cfg (
    id UUID PRIMARY KEY,
    server_id UUID NOT NULL UNIQUE,
    probability SMALLINT NOT NULL, -- Probability in percent.
    enable_probabilistic BOOLEAN NOT NULL,
    is_allowlist BOOLEAN NOT NULL,
    is_receive_only BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    FOREIGN KEY (server_id) REFERENCES servers (id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX subscription_cfg_server_id_idx ON subscription_cfg (server_id);
CREATE INDEX subscription_cfg_enable_probabilistic_idx ON subscription_cfg (enable_probabilistic);
CREATE INDEX subscription_cfg_is_allowlist_idx ON subscription_cfg (is_allowlist);
CREATE INDEX subscription_cfg_is_receive_only_idx ON subscription_cfg (is_receive_only);
CREATE INDEX subscription_cfg_created_at_idx ON subscription_cfg (created_at);
CREATE INDEX subscription_cfg_updated_at_idx ON subscription_cfg (updated_at);

CREATE TABLE server_subscription (
    id UUID PRIMARY KEY,
    subscriber_server_id UUID NOT NULL,
    target_server_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    FOREIGN KEY (subscriber_server_id) REFERENCES servers (id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (target_server_id) REFERENCES servers (id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX server_subscription_subscriber_server_id_idx ON server_subscription (subscriber_server_id);
CREATE INDEX server_subscription_target_server_id_idx ON server_subscription (target_server_id);
CREATE INDEX server_subscription_created_at_idx ON server_subscription (created_at);
CREATE INDEX server_subscription_updated_at_idx ON server_subscription (updated_at);

CREATE TABLE tag_subscription (
    id UUID PRIMARY KEY,
    subscriber_server_id UUID NOT NULL,
    target_tag_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL,
    FOREIGN KEY (subscriber_server_id) REFERENCES servers (id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (target_tag_id) REFERENCES tags (id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX tag_subscription_subscriber_server_id_idx ON tag_subscription (subscriber_server_id);
CREATE INDEX tag_subscription_target_tag_id_idx ON tag_subscription (target_tag_id);
CREATE INDEX tag_subscription_created_at_idx ON tag_subscription (created_at);
CREATE INDEX tag_subscription_updated_at_idx ON tag_subscription (updated_at);
