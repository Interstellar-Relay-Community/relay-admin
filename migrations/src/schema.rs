// SPDX-FileCopyrightText: 2023 perillamint <perillamint@silicon.moe>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

// @generated automatically by Diesel CLI.

diesel::table! {
    servers (id) {
        id -> Uuid,
        webfinger -> Text,
        authority -> Text,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
    }
}

diesel::table! {
    tag_server_bridge (id) {
        id -> Uuid,
        tag_id -> Uuid,
        server_id -> Uuid,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
    }
}

diesel::table! {
    tags (id) {
        id -> Uuid,
        tag -> Text,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
    }
}

diesel::table! {
    user_idp (id) {
        id -> Uuid,
        user_id -> Uuid,
        idp -> Text,
        idp_id -> Text,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
    }
}

diesel::table! {
    users (id) {
        id -> Uuid,
        email -> Text,
        permission -> Jsonb,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
    }
}

diesel::joinable!(tag_server_bridge -> servers (server_id));
diesel::joinable!(tag_server_bridge -> tags (tag_id));
diesel::joinable!(user_idp -> users (user_id));

diesel::allow_tables_to_appear_in_same_query!(
    servers,
    tag_server_bridge,
    tags,
    user_idp,
    users,
);
