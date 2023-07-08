-- SPDX-FileCopyrightText: 2023 perillamint <perillamint@silicon.moe>
--
-- SPDX-License-Identifier: AGPL-3.0-or-later

-- Your SQL goes here
CREATE TABLE users (
    id UUID PRIMARY KEY,
    email text,
    permission JSONB,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

CREATE INDEX users_email_idx ON users (email);
CREATE INDEX users_created_at_idx ON users (created_at);
CREATE INDEX users_updated_at_idx ON users (updated_at);

CREATE TABLE user_idp (
    id UUID PRIMARY KEY,
    user_id UUID,
    idp TEXT,
    idp_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX user_idp_user_id_idx ON user_idp (user_id);
CREATE INDEX user_idp_idp_idx ON user_idp (idp);
CREATE INDEX user_idp_created_at_idx ON user_idp (created_at);
CREATE INDEX user_idp_updated_at_idx ON user_idp (updated_at);
