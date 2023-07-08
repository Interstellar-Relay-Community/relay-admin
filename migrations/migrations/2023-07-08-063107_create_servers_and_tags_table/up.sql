-- SPDX-FileCopyrightText: 2023 perillamint <perillamint@silicon.moe>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

-- Your SQL goes here
CREATE TABLE servers (
    id UUID PRIMARY KEY,
    webfinger TEXT,
    authority TEXT,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

CREATE INDEX servers_webfinger_idx ON servers (webfinger);
CREATE INDEX servers_authority_idx ON servers (authority);
CREATE INDEX servers_created_at_idx ON servers (created_at);
CREATE INDEX servers_updated_at_idx ON servers (updated_at);

CREATE TABLE tags (
    id UUID PRIMARY KEY,
    tag TEXT,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

CREATE INDEX tags_tag_idx ON tags (tag);
CREATE INDEX tags_created_at_idx ON tags (created_at);
CREATE INDEX tags_updated_at_idx ON tags (updated_at);

CREATE TABLE tag_server_bridge (
    id UUID PRIMARY KEY,
    tag_id UUID,
    server_id UUID,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (tag_id) REFERENCES tags (id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (server_id) REFERENCES servers (id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX tag_server_bridge_tag_id_idx ON tag_server_bridge (tag_id);
CREATE INDEX tag_server_bridge_server_id_idx ON tag_server_bridge (server_id);
CREATE INDEX tag_server_bridge_created_at_idx ON tag_server_bridge (created_at);
CREATE INDEX tag_server_bridge_updated_at_idx ON tag_server_bridge (updated_at);
